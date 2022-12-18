
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:flutter/material.dart';

class GoToCocktailInfoButton extends StatelessWidget {
  final String cocktailId;
  GoToCocktailInfoButton(this.cocktailId);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: IconButton(
         icon : const Icon(Icons.arrow_back),
         color: Colors.black,
         iconSize: 32,
         onPressed:()=> Navigator.pushNamed(
          context, 
          CocktailInfo.routeName,
          arguments: cocktailId
          )
      )
    );
  }
}