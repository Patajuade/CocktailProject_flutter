import 'dart:convert';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:flutter/cupertino.dart';

//https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring

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
      ingredients: fromJsonToList(json["ingredients"]),
      cocktailPicture: json["cocktailPicture"],
      tags: fromJsonToList(json["tags"])
      );

  static List<String> fromJsonToList(dynamic property){ //transforme l'array dynamique en une liste de string
    return List.from((property as List).map((item) => item as String).toList());
  }

  Map<String,dynamic> toJson(){
    return {
      "description":description,
      "name":name,
      "ingredients":[],
      "cocktailPicture":cocktailPicture,
      "tags":tags
    };
  }

  set name(String name){
    this.name = name;
  }
  set description(String description){
    this.description = description;
  }
  set ingredients(List<String> ingredients){
    this.ingredients = ingredients;
  }
  set tags(List<String> tags){
    this.tags = tags;
  }
  set cocktailPicture(String cocktailPicture){
    this.cocktailPicture = cocktailPicture;
  }
}
