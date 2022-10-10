import 'package:e_commerce/ui/authentication_screen/authentication_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String welcomeScreen = '/welcomeScreen';
  static const String authenticationScreen = '/authenticationScreen';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
        );
      case welcomeScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const WelcomeScreen(),
        );
      case authenticationScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AuthenticationScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String screenName) {}
}
