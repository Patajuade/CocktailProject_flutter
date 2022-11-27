import 'package:flutter/material.dart';

class CocktailPicture extends StatelessWidget {
  final String cocktailPicture;
  CocktailPicture({required this.cocktailPicture, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(cocktailPicture),
            height: 250,
            width: 250,
          ),
        ),
      );
  }
}
