import 'package:flutter/material.dart';

import '../../view/screen/main_screen.dart';

class AppRouting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (context) => const MainScreen());
    }
  }
}
