import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';

class SaveCocktailButton extends StatelessWidget {
  final Cocktail cocktail;
  final String cocktailId;
  SaveCocktailButton({Key? key, required this.cocktail, required this.cocktailId});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: IconButton(
         icon : const Icon(Icons.save),
         color: Colors.black,
         iconSize: 32,
         onPressed:()=>print(cocktail.name)
      )
    );
  }
}