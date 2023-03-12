import 'package:flutter/material.dart';

import '../../controller/model/recipe_model.dart';
import '../../logic/invoke_favorite_logic.dart';
import '../screen/recepie_detail_screen.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget({
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
  final invokeFavorite = InvokeFavorite();

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
                width: MediaQuery.of(context).size.width * 0.33,
              ),
              // TODO: I will implement this feature later
              // GestureDetector(
              //   onTap: () async {
              //     if (await invokeFavorite.hasKey('Recipe')) {
              //       final list = await invokeFavorite.getData('Recipe');
              //       list.add(recipe);
              //       await invokeFavorite.addData('Recipe', list);
              //     } else {
              //       final list = [];
              //       list.add(recipe);
              //       await invokeFavorite.addData('Recipe', list);
              //     }
              //   },
              //   child: Icon(
              //     Icons.favorite_border_outlined,
              //     color: Colors.red[500],
              //     weight: 1,
              //     fill: 1,
              //   ),
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
