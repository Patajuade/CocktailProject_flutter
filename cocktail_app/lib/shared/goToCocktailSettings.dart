import 'package:cocktail_app/cocktailSettings/cocktailSettingsScreen.dart';
import 'package:flutter/material.dart';

class GoToCocktailSettingsButton extends StatefulWidget {
  final String cocktailId;
  GoToCocktailSettingsButton(this.cocktailId);

  @override
  State<StatefulWidget> createState() => _GoToCocktailSettingsButton();
}

class _GoToCocktailSettingsButton extends State<GoToCocktailSettingsButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            iconSize: 32,
            onPressed: () {
              Navigator.pushNamed(context, CocktailSettings.routeName, arguments: widget.cocktailId);
            }));
  }
}