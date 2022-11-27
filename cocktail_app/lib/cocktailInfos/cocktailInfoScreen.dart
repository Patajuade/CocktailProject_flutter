import 'package:cocktail_app/cocktailInfos/widgets/cocktailPicture.dart';
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
          'https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg',
    );

    return Scaffold(
        body: Wrap(
      children: [
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(direction: Axis.horizontal, children: [
              Container(
                //TODO: extract to widget
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ClipRRect(
                  //to make the image round
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(cocktail.cocktailPicture),
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Flex(direction: Axis.vertical, children: [
                Name(cocktail.name, key),
                //tags
                SizedBox(
                  width: 200,
                  child:Wrap(
                  direction: Axis.horizontal,
                  spacing: 5,
                  runSpacing: 5,
                  runAlignment: WrapAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.pink,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: const Text(
                        'Alcool',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Fruit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Citron',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Fruit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Citron',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ) 
                )
                
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
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            maxWidth: double.infinity,
            minHeight: 200,
            maxHeight: 500,
          ),
          child: Ingredients(cocktail.ingredients, key),
        ),
      ],
    ));
  }
}
