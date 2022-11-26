import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  Ingredients(this.ingredients, Key? key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        ingredients.join(' - '),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }


}