import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  Ingredients(this.ingredients, Key? key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: ingredients.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              ingredients[index],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        );
      });
  }
}

class IngredientsList extends StatelessWidget{ 
  final Cocktail cocktail; 
  IngredientsList({required this.cocktail, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              maxWidth: double.infinity,
              minHeight: 0,
              maxHeight: 400,
            ),
            child: Ingredients(cocktail.ingredients, key),
          ),
    );
  }
}