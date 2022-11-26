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
      description:
          'The best cocktail everThe best cocktail everThe best cocktail everThe best cocktail everThe best cocktail everThe best cocktail everThe best cocktail everThe best cocktail ever',
      name: 'Le Pouetjito',
      id: '123456789',
      ingredients: [
        'Pouet',
        'Vokda',
        'Sirop de fruit de la passion',
        'Schweppes'
      ],
      cocktailPicture:
          "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
    );

    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flex(direction: Axis.horizontal, children: [
            //picture
            Flex(direction: Axis.vertical, children: [
              Name(cocktail.name, key),
              //tags
            ]),
          ]),
          Description(
            description: cocktail.description,
            titleStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            descriptionStyle: const TextStyle(
              fontSize: 14,
            ),
            key: key,
          ),
          Ingredients(cocktail.ingredients, key),
        ],
      ),
    );
  }
}
