import 'package:flutter/material.dart';

import '../../view/widget/categories_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.red[900],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CategoriesCard(
                title: 'BreakFast',
              ),
              const CategoriesCard(
                title: 'Lunch',
              ),
              const CategoriesCard(
                title: 'Dinner',
              ),
              const CategoriesCard(
                title: 'Drinks',
              ),
              const CategoriesCard(
                title: 'Desserts',
              ),
              const CategoriesCard(
                title: 'Soups',
              ),
              const CategoriesCard(
                title: 'Salads',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
