// import 'package:device_preview/device_preview.dart';
import
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext contex t) {
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