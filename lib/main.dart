import 'package:flutter/material.dart';
import 'package:mr_food/view/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              color: Colors.transparent, elevation: 0, centerTitle: true),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen() //CategoriesScreen() //MyHomePage(),
        );
  }
}
