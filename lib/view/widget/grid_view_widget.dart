import 'package:flutter/material.dart';

import '../screen/recepie_detail_screen.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  });
  final String imageUrl;
  final String title;
  final int id;

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
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  fill: 1,
                ),
              ),
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
