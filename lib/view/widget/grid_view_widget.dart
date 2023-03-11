import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: GridTileBar(
        trailing: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
            ),
            const Icon(Icons.favorite_border, color: Colors.white),
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
    );
  }
}
