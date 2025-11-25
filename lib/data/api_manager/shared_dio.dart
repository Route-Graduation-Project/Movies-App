import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio sharedDio(){
  Dio dio = Dio();
  // dio.interceptors.add(PrettyDioLogger(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: true,
  //   responseHeader: false,
  //   error: true,
  //   compact: true,
  //   maxWidth: 90,
  //   enabled: kDebugMode,));
  return dio;
}