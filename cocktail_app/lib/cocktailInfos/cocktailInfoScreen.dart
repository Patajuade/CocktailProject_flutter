import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/header.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailInfo extends StatelessWidget {
  static const routeName = '/CocktailInfo';

  CocktailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktail =
        ModalRoute.of(context)!.settings.arguments as Cocktail;

    return Scaffold(
      body: Column(
        children: [
          Header(cocktail: cocktail),
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
