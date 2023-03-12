import 'package:flutter/material.dart';

import '../../controller/model/recipe_model.dart';
// import '../../logic/invoke_favorite_logic.dart';
import '../screen/recepie_detail_screen.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.recipe,
  });
  final String imageUrl;
  final String title;
  final int id;
  final Recipe recipe;
  // final invokeFavorite = InvokeFavorite();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              image: imageUrl,
            ),
          ),
        );
      },
      child: GridTile(
        header: GridTileBar(
          trailing: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.31,
              ),
              // TODO: I will implement this feature later
              // LikeButton(
              //   onTap: (isLiked) async {
              //     if (await invokeFavorite.hasKey('Recipe')) {
              //       final list = await invokeFavorite.getData('Recipe');
              //       list.add(recipe);
              //       await invokeFavorite.addData('Recipe', list);
              //     } else {
              //       List<Recipe> list = [];
              //       list.add(recipe);
              //       await invokeFavorite.addData('Recipe', list);
              //     }
              //     return null;
              //   },
              // ),
            ],
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
