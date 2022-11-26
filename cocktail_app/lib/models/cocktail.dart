import 'package:flutter/cupertino.dart';

class Cocktail{
  final String? description;
  final String? name;
  final String? id;
  final List<String> ingredients;
  final String? cocktailPicture;
  //tags
  //picture
  //ingredients
const Cocktail({this.description, this.name, this.id, required this.ingredients, this.cocktailPicture});


}
