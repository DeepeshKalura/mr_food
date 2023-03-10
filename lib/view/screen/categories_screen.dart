import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Categories'),
          ],
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard(
      {super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24, // set the font size of the text
                fontWeight: FontWeight.bold, // set the font weight of the text
              ),
            ),
          ),
          Image.asset(
            'path/to/$imageUrl',
            height: 200, // set the height of the image
            width: double.infinity, // set the width to fill the card
            fit: BoxFit.cover, // scale the image to fit the space
          ),
        ],
      ),
    );
  }
}
