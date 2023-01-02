import 'package:flutter/material.dart';

class CocktailPicture extends StatelessWidget {
  final String cocktailPicture;
  CocktailPicture({required this.cocktailPicture, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 5), 
      child : ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image(
        image: NetworkImage(cocktailPicture),
        height: 150,
        width: 150,
      ),
    )
    );
    
  }
}
