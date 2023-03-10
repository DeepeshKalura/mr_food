import 'package:flutter/material.dart';

import 'package:mr_food/controller/model/recipe_model.dart';

class RowSlidindCard extends StatefulWidget {
  const RowSlidindCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RowSlidindCard> createState() => _RowSlidindCardState();
}

class _RowSlidindCardState extends State<RowSlidindCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to recipe details screen
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'poster-${widget.recipe.id}',
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.recipe.image ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVoxHsNEztGWOV4UN7UKLVbfkPGp14t8iSgrpScY&s', //TODO: Add default image
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Hero(
                tag: 'title-${widget.recipe.id}',
                child: Text(
                  widget.recipe.title ?? "Error",
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
