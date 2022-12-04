
import 'package:cocktail_app/cocktailOverview/cocktailOverviewScreen.dart';
import 'package:flutter/material.dart';

class GoToCocktailOverviewButton extends StatelessWidget {
  GoToCocktailOverviewButton({Key? key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: IconButton(
         icon : const Icon(Icons.home),
         color: Colors.black,
         iconSize: 32,
         onPressed:()=> Navigator.pushNamed(context, CocktailOverview.routeName)
      )
    );
  }
}