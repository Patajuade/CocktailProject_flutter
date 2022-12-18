import 'package:cocktail_app/models/cocktail.dart';

class CurrentCocktailEvent {}

class SetCurrentCocktailEvent extends CurrentCocktailEvent {
  final String id;
  SetCurrentCocktailEvent(this.id);
}

class UpdateCocktailEvent extends CurrentCocktailEvent {
  final String id;
  final Cocktail cocktail;
  UpdateCocktailEvent(this.id, this.cocktail);
}