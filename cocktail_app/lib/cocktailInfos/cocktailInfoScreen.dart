import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/cocktailInfos/widgets/name.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CocktailInfo extends StatelessWidget {
  late Cocktail cocktail;

  CocktailInfo({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cocktail = const Cocktail(
      description: 'The best cocktail ever',
      name: 'Le Pouetjito',
      id: '123456789',
      ingredients: ['Pouet', 'Vokda', 'Sirop de fruit de la passion', 'Schweppes'],
      );

  return Scaffold(
    appBar: AppBar(
      title: const Text('Cocktail Info'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Name(cocktail.name, key),
          Description(cocktail.description, const Key('description')),
          Ingredients(cocktail.ingredients, key),
        ],
      ),
    ),
  );
}
}