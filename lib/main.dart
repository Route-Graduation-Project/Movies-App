// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/base/bloc_observer.dart';
import 'package:movies_app/run_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MoviesApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MoviesApp(),
  //   ),
  // );
}
