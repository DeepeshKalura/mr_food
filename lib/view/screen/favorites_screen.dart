import 'package:flutter/material.dart';
import 'package:mr_food/view/widget/title_text_widget.dart';

// TODO: implement Favorite Screen With Hive
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var DummyData = [];
  var isShowing = false;
  @override
  initState() {
    super.initState();
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
                itemCount: DummyData.length,
                itemBuilder: (context, index) {
                  final movie = DummyData[index];
                  return DummiestMovieCard(
                    movie: movie,
                  );
                },
              ),
            ),
          );
  }
}

class DummiestMovieCard extends StatelessWidget {
  final movie;

  const DummiestMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
