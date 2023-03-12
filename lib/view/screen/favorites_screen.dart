import 'package:flutter/material.dart';

import '../../controller/model/recipe_model.dart';
// import '../../logic/invoke_favorite_logic.dart';
import '../widget/grid_view_widget.dart';
import '../widget/title_text_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final InvokeFavorite invokeFavorite = InvokeFavorite();

  List<Recipe> favoriteList = [];
  var isShowing = false;
  @override
  initState() {
    super.initState();
  }

  callingLogic() async {
    // favoriteList = await invokeFavorite.getData('Recipe');
    setState(() {
      isShowing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isShowing == false
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const AppBarTitle(
                    firstText: 'Favorites', secondText: 'Recipes'),
              ),
              body: ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final recipe = favoriteList[index];
                  return GridViewWidget(
                    imageUrl: recipe.image ?? '',
                    title: recipe.title ?? '',
                    id: recipe.id ?? 0,
                    recipe: recipe,
                  );
                },
              ),
            ),
          );
  }
}
