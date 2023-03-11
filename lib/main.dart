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
          appBarTheme: AppBarTheme(
            color: Colors.grey[300],
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.red),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen() //MyHomePage(),
        );
  }
}
