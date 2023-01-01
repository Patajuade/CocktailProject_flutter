import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/models/cocktail.dart';

class CocktailEvent {}

class LoadCocktailListEvent extends CocktailEvent {
  final String? id;
  final Cocktail? cocktail;
  LoadCocktailListEvent(this.id, this.cocktail);
}

class SetCurrentCocktailEvent extends CocktailEvent {
  final String? id;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  SetCurrentCocktailEvent(this.id, this.cocktails);
}

class ClearCurrentCocktailEvent extends CocktailEvent {
  ClearCurrentCocktailEvent();
}

class UpdateCurrentCocktailEvent extends CocktailEvent {
  final String id;
  final Cocktail cocktail;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  UpdateCurrentCocktailEvent(this.id, this.cocktail, this.cocktails);
}

class AddNewCocktailEvent extends CocktailEvent {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  AddNewCocktailEvent(this.cocktails);
}

class FilterCocktailListEvent extends CocktailEvent {
  final String? id;
  final Cocktail? cocktail;
  final String filter;
  FilterCocktailListEvent(this.filter,this.id, this.cocktail);
}

class AddTagToCocktailEvent extends CocktailEvent {
  final String id;
  final Cocktail? cocktail;
  final String tag;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  AddTagToCocktailEvent(this.id,this.tag, this.cocktail, this.cocktails);
}

class AddIngredientToCocktailEvent extends CocktailEvent {
  final String id;
  final Cocktail? cocktail;
  final String ingredient;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  AddIngredientToCocktailEvent(this.id, this.ingredient, this.cocktail, this.cocktails);
}