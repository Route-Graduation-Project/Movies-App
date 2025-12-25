import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/l10n/generated/i18n/app_localizations.dart';
import 'package:movies_app/core/theme.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_injection.dart';
import 'package:movies_app/presentation/home/home_cubit/home_cubit.dart';
import 'core/routing/app_routes.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({required this.initialRoute, super.key});

  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => injectionLoginCubit()),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
      ],
      child: MaterialApp(
        // useInheritedMediaQuery: true,
        // builder: DevicePreview.appBuilder,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
