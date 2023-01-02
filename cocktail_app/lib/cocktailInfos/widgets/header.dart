import 'package:cocktail_app/cocktailInfos/widgets/cocktailPicture.dart';
import 'package:cocktail_app/cocktailInfos/widgets/name.dart';
import 'package:cocktail_app/cocktailInfos/widgets/tags.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Cocktail cocktail;
  Header({required this.cocktail, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom:0), 
      padding:const EdgeInsets.only(top:30, left: 5 , right: 0 , bottom: 5),
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(children: [
        CocktailPicture(cocktailPicture: cocktail.cocktailPicture),
        Expanded(
            child: SizedBox(
          //pour mettre une width à une colonne
          width: double.infinity,
          child: Container(
            margin:const EdgeInsets.symmetric(horizontal: 2), 
            child: Column(children: [
            Name(name: cocktail.name),
            Tags(cocktail.tags),
          ]),
          )
          
        ))
      ]),
    );
  }
}
