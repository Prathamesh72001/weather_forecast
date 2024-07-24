
import 'package:flutter/material.dart';

import '../view/screens/home/home_screen.dart';

class AppRouter {
  static const String homeScreen = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static Future<void> navigateTo(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }

  static Future<void> replaceWith(BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
