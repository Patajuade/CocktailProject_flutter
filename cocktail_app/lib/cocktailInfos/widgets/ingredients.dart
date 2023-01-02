import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  Ingredients(this.ingredients, Key? key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ingredients.length,
        prototypeItem: const ListTile(
          title: Center(
              child: Text(
                  "Ingredients")), //sert à prévenir le ListView de ce à quoi va ressembler la Tile même s'il n'a pas encore d'ingrédents. On aurait pu mettre un string vide.
        ),
        //separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Center(
                child: Text(
              ingredients[index],
              style:
                  TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight : FontWeight.bold
            ))),
          );
        });
  }
}

class IngredientsList extends StatelessWidget {
  final Cocktail cocktail;
  IngredientsList({required this.cocktail, Key? key});

  @override
  Widget build(BuildContext context) {
    return Ingredients(cocktail.ingredients, key);
  }
}
