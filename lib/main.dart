import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'app/locale/app_locale.dart';
import 'app/route/app_routes.dart';
import 'app/service/locator/service_locator.dart';
import 'app/service/network_checker/network_checker_service.dart';
import 'app/theme/app_theme.dart';
import 'view/main/main_view.dart';

Future<void> main() async {
  // Initialize binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  initializeDateFormatting();

  // Setup service locator
  setupServiceLocator();

  // Initialize Firebase (google-service.json required)
  // await FcmService.initNotification(
  //   onMessageHandler: (message) {},
  //   onBackgroundHandler: (message) {},
  // );

  // Initialize local notification service
  // await LocalNotifService.initLocalNotifService(
  //   packageName: "com.example.app",
  //   channelName: "example notification",
  // );

  // Initialize local notification service
  // await LocalNotifService.initLocalNotifService();

  // Set/lock orientationgvhvgj
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Set overlay style
  SystemChrome.setSystemUIOverlayStyle(AppTheme.lightOverlayStyle);

  // runApp()
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Providers
        ChangeNotifierProvider(create: (_) => locator<NetworkCheckerService>()),
      ],
      child: MaterialApp(
        title: 'Alvamind Library 3',
        theme: AppTheme.themeSelector(),
        scrollBehavior: AppTheme.scrollBehavior(context),
        debugShowCheckedModeBanner: true,
        initialRoute: MainView.routeName,
        routes: AppRoutes.routes,
        locale: AppLocale.defaultLocale,
        supportedLocales: AppLocale.supportedLocales,
        localizationsDelegates: AppLocale.localizationsDelegates,
      ),
    );
  }
}
