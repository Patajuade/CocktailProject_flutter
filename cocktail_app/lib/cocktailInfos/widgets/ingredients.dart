import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  Ingredients(this.ingredients, Key? key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ingredients.length,
        prototypeItem:ListTile(
              title: Center(child: Text(ingredients.first) ),
          ) ,
        //separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Center(child: Text(ingredients[index]) ),
          );
      });
  }
}

class IngredientsList extends StatelessWidget{ 
  final Cocktail cocktail; 
  IngredientsList({required this.cocktail, Key? key});

  @override
  Widget build(BuildContext context) {
    return Ingredients(cocktail.ingredients,key);
  }
}