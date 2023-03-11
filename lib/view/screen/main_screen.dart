import 'package:flutter/material.dart';

import '../../controller/model/recipe_model.dart';
import '../../logic/invoke_recipe_logic.dart';
import '../../view/widget/title_text_widget.dart';
import '../widget/grid_view_widget.dart';
import 'splash_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final InvokingAPI _invokingAPI = InvokingAPI();
  List<Recipe> popularRecipe = [];
  final searchTextEditior = TextEditingController();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    callingLogic();
  }

  void callingLogic() async {
    popularRecipe = await _invokingAPI.getPopularRecipe();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchTextEditior.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? const SplashScreen()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const AppBarTitle(
                  firstText: 'Popular',
                  secondText: 'Recipie',
                ),
              ),
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: TextField(
                      controller: searchTextEditior,
                      onSubmitted: (value) {
                        // TODO: Implement search
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Making More Decorative
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2.4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: popularRecipe.length,
                      itemBuilder: (context, index) {
                        final recipe = popularRecipe[index];
                        return GridViewWidget(
                          imageUrl: recipe.image ?? '',
                          title: recipe.title ?? 'Error',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
