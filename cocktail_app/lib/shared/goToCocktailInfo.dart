
import 'package:flutter/material.dart';

class GoToCocktailInfoButton extends StatelessWidget {
  final Function onPressed;
  GoToCocktailInfoButton({Key? key, required this.onPressed});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: IconButton(
         icon : const Icon(Icons.arrow_back),
         color: Colors.black,
         iconSize: 32,
         onPressed:()=> onPressed()
      )
    );
  }
}