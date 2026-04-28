import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_ui/feature/notification/controller/notification_controller.dart';
import 'package:social_media_ui/route/app_route_config.dart';
import 'package:social_media_ui/theme/light_theme.dart';
import 'package:social_media_ui/utils/get_di.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  init;
  await requestNotificationPermission();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GoRouter _router = AppRouteConfig().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BharatNova',
      theme: light,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
