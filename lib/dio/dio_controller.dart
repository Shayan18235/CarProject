import 'dart:io';

import 'package:carapi/dio/dio_repository.dart';
import 'package:carapi/model/user_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthState {
  final bool isLogin;
  UserModel? user = UserModel();
  final String? token;
  AuthState({this.isLogin = false, UserModel? user, this.token}) : user = user ?? UserModel();
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref<ProviderRef> read;

  final storage = new FlutterSecureStorage();
  AuthNotifier(this.read) : super(AuthState());
  Future<void> login(Map user) async {
    try {
      final dio = read.read(DioLoginProvider);
      final response = await dio.post(
        '/login',
        data: user,
      );
      final token = response.data['token'].toString();
      state = AuthState(isLogin: true, user: state.user, token: token);
      await storeToken(token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> tryToken(String? token) async {
    try {
      final dio = read.read(DioRegisterProvider);
      final response = await dio.post('/profile', options: Options(headers: {'Authorization': 'Bearer $token'}));
      final user = UserModel.fromJson(response.data);
      state = AuthState(isLogin: true, user: user, token: token);
      await storeToken(token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeToken(String? token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> logout() async {
    try {
      final dio = read.read(dioProvider);
      final response = await dio.post('/logout',
          options: Options(headers: {
            'Authorization': 'Bearer state.token',
          }));
      await cleanUp();
    } catch (e) {
      print(e);
    }
  }

  Future<void> cleanUp() async {
    state = AuthState();
    await storage.delete(key: 'token');
  }
}

final deviceNameProvider = FutureProvider<String?>(
  (ref) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.utsname.machine;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  },
);
