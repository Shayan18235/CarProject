import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'api': '1.0.0',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      validateStatus: (status) => status != null && status >= 200 && status < 300,
    ),
  );
});
final DioLoginProvider = Provider<Dio>((ref) {
  return Dio(ref.read(dioProvider).options)..options.baseUrl = 'http://login';
});
final DioRegisterProvider = Provider<Dio>((ref) {
  return Dio(ref.read(dioProvider).options)..options.baseUrl = 'http://register';
});
