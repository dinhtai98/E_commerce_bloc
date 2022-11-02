import 'package:e_commerce/ui/authentication_screen/authentication_screen.dart';
import 'package:e_commerce/ui/basket_screen/basket_screen.dart';
import 'package:e_commerce/ui/delivery_status_screen/delivery_status_screen.dart';
import 'package:e_commerce/ui/home_screen/home_screen.dart';
import 'package:e_commerce/ui/order_completed_screen/order_completed_screen.dart';
import 'package:e_commerce/ui/product_screen/product_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String welcomeScreen = '/welcomeScreen';
  static const String authenticationScreen = '/authenticationScreen';
  static const String homeScreen = '/homeScreen';
  static const String productScreen = '/productScreen';
  static const String myBasketScreen = '/myBasketScreen';
  static const String orderCompleted = '/orderCompleted';
  static const String deliveryStatusScreen = '/deliveryStatusScreen';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  // Example for Effect
  // static PageRouteBuilder _buildRouteNavigationEffect(
  //     RouteSettings settings, Widget widget) {
  //   return PageRouteBuilder(
  //     pageBuilder: (_, __, ___) => widget,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
  //         AnimatedBuilder(
  //       animation: animation,
  //       builder: (context, widget) => Transform.scale(
  //         scale: animation.value,
  //         alignment: Alignment.bottomRight,
  //         child: child,
  //       ),
  //     ),
  //     transitionDuration: const Duration(milliseconds: 500),
  //     settings: settings,
  //   );
  // }

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
      case homeScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      case productScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ProductScreen(
              arguments: settings.arguments as ProductScreenArguments),
        );
      case myBasketScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const BasketScreen(),
        );
      case orderCompleted:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrderCompletedScreen(),
        );
      case deliveryStatusScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const DeliveryStatusScreen(),
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
