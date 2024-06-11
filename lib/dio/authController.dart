import 'dart:async';

import 'package:carapi/dio/authRepository.dart';
import 'package:carapi/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends AsyncNotifier<UserModel?> {
  @override
  FutureOr<UserModel?> build() async {
    return state.value;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      var user = await ref.read(authRepositoryProvider).signInWithEmailAndPassword(email, password);
      if (user != null) {
        state = AsyncData(user);
      } else {
        state = const AsyncData(null);
      }
    } catch (e) {
      state = AsyncError('Error', StackTrace.fromString('$e'));
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const AsyncData(null);
  }
}

AsyncNotifierProvider<AuthController, UserModel?> authControllerProvider = AsyncNotifierProvider<AuthController, UserModel?>(AuthController.new);
