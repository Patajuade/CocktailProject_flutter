import 'package:flutter/cupertino.dart';

class Cocktail{
  final String description;
  final String name;
  final String id;
  final List<String> ingredients;
  final String cocktailPicture;
  final List<String> tags;
  //tags
  //picture
  //ingredients
const Cocktail({
  required this.description, 
  required this.name, 
  required this.id, 
  required this.ingredients, 
  required this.cocktailPicture,
  required this.tags
  });
}
