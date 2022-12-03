import 'package:flutter/cupertino.dart';

class Cocktail {
  final String description;
  final String name;
  final List<String> ingredients;
  final String cocktailPicture;
  final List<String> tags;
  //tags
  //picture
  //ingredients
  const Cocktail(
      {
      required this.description,
      required this.name,
      required this.ingredients,
      required this.cocktailPicture,
      required this.tags});

  factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
      description: json["description"],
      name: json["name"],
      ingredients: [],
      cocktailPicture: json["cocktailPicture"],
      tags: []);

  Map<String,dynamic> toJson(){
    return {
      "description":description,
      "name":name,
      "ingredients":[],
      "cocktailPicture":cocktailPicture,
      "tags":[]
    };
  }
}
