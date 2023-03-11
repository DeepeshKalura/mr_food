import 'package:flutter/material.dart';

import '../../controller/model/recipe_model.dart';
import '../../logic/invoke_recipe_logic.dart';
import '../widget/grid_view_widget.dart';
import '../widget/title_text_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.title});
  final String title;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final InvokingAPI _invokingAPI = InvokingAPI();
  List<Recipe> recipeList = [];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    callingSearchLogic(widget.title);
  }

  callingSearchLogic(String query) async {
    recipeList = await _invokingAPI.getSearchRecipe(query);
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? const SafeArea(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: AppBarTitle(
                  firstText: 'Searched',
                  secondText: widget.title,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final recipe = recipeList[index];
                    return GridViewWidget(
                      imageUrl: recipe.image ?? 'Error',
                      title: recipe.title ?? 'Error',
                      id: recipe.id ?? 0,
                    );
                  },
                ),
              ),
            ),
          );
  }
}
