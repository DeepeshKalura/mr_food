import 'package:flutter/material.dart';

import '../../view/screen/main_screen.dart';
import '../../view/screen/search_screen.dart';

class AppRouting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case '/search':
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      default:
        return MaterialPageRoute(builder: (context) => const MainScreen());
    }
  }
}
