import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mr_food/controller/model/recipe_model.dart';

import '../../logic/invoke_recipe_logic.dart';
import '../widget/row_slider_card.dart';
import '../widget/title_text_widget.dart';
import 'splash_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchTextEditior = TextEditingController();
  int intialPopularPage = 1;
  int initialTrendingPage = 1;
  final InvokingAPI _invokingAPI = InvokingAPI();
  List<Recipe> popularRecipe = [];
  List<Recipe> trendingRecipe = [];
  var isLoading = false;

  PageController _popularRecipeController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  PageController _trendingRecipeController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    super.initState();
    _popularRecipeController = PageController(
      initialPage: intialPopularPage,
      viewportFraction: 0.8,
    );
    _trendingRecipeController = PageController(
      initialPage: initialTrendingPage,
      viewportFraction: 0.8,
    );
    callingLogic();
  }

  void callingLogic() async {
    popularRecipe = await _invokingAPI.getPopularRecipe();
    trendingRecipe = await _invokingAPI.getTrendingRecipe();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchTextEditior.dispose();
    _popularRecipeController.dispose();
    _trendingRecipeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? const SplashScreen()
        : SafeArea(
            child: Scaffold(
              appBar: Appbar(
                titile: const AppBarTitle(),
              ),
              body: SingleChildScrollView(
                child: Column(
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                        maxWidth: 2000,
                      ),
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: PageView.builder(
                          controller: _popularRecipeController,
                          itemCount: popularRecipe.length,
                          itemBuilder: (context, index) =>
                              buildPopularSlider(index),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                        maxWidth: 2000,
                      ),
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: PageView.builder(
                          controller: _trendingRecipeController,
                          itemCount: trendingRecipe.length,
                          itemBuilder: (context, index) =>
                              buildTrendingSlider(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget buildPopularSlider(int index) => AnimatedBuilder(
        animation: _popularRecipeController,
        builder: (context, child) {
          double value = 2;
          if (_popularRecipeController.position.haveDimensions) {
            value = (index - _popularRecipeController.page!);
            value = ((value.abs() * 0.038)).clamp(-1.0, 1.0);
          }
          var recepie = popularRecipe[index]; // Has to changed
          return Center(
            child: SizedBox(
              child: Transform.rotate(
                angle: math.pi * value,
                child: RowSlidindCard(recipe: recepie),
              ),
            ),
          );
        },
      );

  Widget buildTrendingSlider(int index) => AnimatedBuilder(
        animation: _trendingRecipeController,
        builder: (context, child) {
          double value = 2;
          if (_trendingRecipeController.position.haveDimensions) {
            value = (index - _trendingRecipeController.page!);
            value = ((value.abs() * 0.038)).clamp(-1.0, 1.0);
          }
          var recepie = trendingRecipe[index]; // Has to changed
          return Center(
            child: SizedBox(
              child: Transform.rotate(
                angle: math.pi * value,
                child: RowSlidindCard(recipe: recepie),
              ),
            ),
          );
        },
      );
}
