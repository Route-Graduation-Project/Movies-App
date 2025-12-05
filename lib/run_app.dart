// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/l10n/generated/i18n/app_localizations.dart';
import 'package:movies_app/core/theme.dart';

import 'core/routing/app_routes.dart';
import 'core/routing/routes.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: Routes.loginRoute,
    );
  }
}
