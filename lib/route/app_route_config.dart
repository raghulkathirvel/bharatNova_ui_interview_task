import 'package:go_router/go_router.dart';
import 'package:social_media_ui/feature/nav/view/bottomNavScreen.dart';
import '../feature/splash/view/splash_screen.dart';
import 'app_route_path.dart';

class AppRouteConfig{
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
          name: AppRoute.splash.name,
          path: AppRoute.splash.path,
          builder: (_,__) => SplashScreen()
      ),

      GoRoute(
          name: AppRoute.bottomNav.name,
          path: AppRoute.bottomNav.path,
          builder: (_,__) => BottomNavScreen()
      ),
    ],
  );
}