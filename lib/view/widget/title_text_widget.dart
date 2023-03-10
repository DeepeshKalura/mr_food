import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
      {super.key, this.firstText = "Food", this.secondText = "Recipe"});
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            // Checking the theme and changing the color accordingly
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          secondText,
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

// Shorcut command  for git add and commit