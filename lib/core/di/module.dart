import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{

  @lazySingleton
  Dio sharedDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      validateStatus: (status) => true,
      receiveTimeout: const Duration(seconds: 120),
      connectTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),

    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    return dio;
  }

}