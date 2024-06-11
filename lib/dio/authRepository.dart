import 'dart:io';

import 'package:carapi/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository({required this.dio});
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await dio.post(
        'login/api',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.userAgentHeader: 'dio',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print(response.data['user']);

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      }

      return null;
    } on DioError catch (e) {
      print(e);
      return null;
    } catch (e) {
      rethrow;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  BaseOptions options = BaseOptions(
    baseUrl: 'baseUrl',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  );

  return Dio(options);
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRepository(dio: dio);
});
