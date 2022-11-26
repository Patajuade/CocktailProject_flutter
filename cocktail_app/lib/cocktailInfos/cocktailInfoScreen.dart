import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CocktailInfo extends StatelessWidget {
  late Cocktail cocktail;

  CocktailInfo({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cocktail = Cocktail(
      description: 'A cocktail',
      name: 'Le Pouetjito',
      id: '123456789'
      );

  return Scaffold(
    appBar: AppBar(
      title: Text('Cocktail Info'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Description(cocktail.description, const Key('description')),
        ],
      ),
    ),
  );
}
}