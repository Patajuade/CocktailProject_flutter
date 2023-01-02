import 'package:flutter/material.dart';

class CocktailPicture extends StatelessWidget {
  final String cocktailPicture;
  CocktailPicture({required this.cocktailPicture, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 5,
          ),
        ),
        child: Image(
          image: NetworkImage(cocktailPicture),
          height: 150,
          width: 150,
        ));
  }
}
