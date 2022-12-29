import 'package:flutter/material.dart';

class RemovableIngredients extends StatelessWidget {
  final List<String> ingredients;
  final Function(String ingredientName) onPressed;
  const RemovableIngredients( {required this.ingredients, required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: ingredients.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 50,
            child: Center(
              child: Row(children: [
                Text(
                  ingredients[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                 IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Colors.red,
                iconSize: 32,
                onPressed: ()=> onPressed(ingredients[index]),  
                    ),
              ]),
            ),
          );
        });
  }
}
