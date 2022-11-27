import 'package:cocktail_app/cocktailInfos/widgets/cocktailPicture.dart';
import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/cocktailInfos/widgets/name.dart';
import 'package:cocktail_app/cocktailInfos/widgets/tags.dart';
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
          'https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg',
      tags: ['#Alcool', '#Fruits', '#Passion', '#Vegan'],
    );

    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            CocktailPicture(cocktailPicture: cocktail.cocktailPicture),
            Expanded(
                child: Container(
              //pour mettre une width à une colonne
              width: double.infinity,
              child: Column(children: [
                Name(name: cocktail.name),
                Tags(cocktail.tags),
              ]),
            ))
          ]),
          Description(
            description: cocktail.description,
            key: key,
          ),
          IngredientsList(cocktail: cocktail, key: key)
        ],
      ),
    );
  }
}
