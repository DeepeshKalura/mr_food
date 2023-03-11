import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 8,
        color: Colors.grey[400],
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          1,
        ),
        shadowColor: Colors.black,
        margin: const EdgeInsets.all(7),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24, // set the font size of the text
                  fontWeight:
                      FontWeight.w400, // set the font weight of the text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
