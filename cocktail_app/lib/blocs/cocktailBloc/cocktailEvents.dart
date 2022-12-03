
import 'package:cocktail_app/models/cocktail.dart';

class CocktailEvent {}

class AddCocktailEvent extends CocktailEvent {
  final Cocktail cocktail;
  AddCocktailEvent(this.cocktail);
}

class RemoveCocktailEvent extends CocktailEvent {
  final Cocktail cocktail;
  RemoveCocktailEvent(this.cocktail);
}

class UpdateCocktailEvent extends CocktailEvent {
  final Cocktail cocktail;
  UpdateCocktailEvent(this.cocktail);
}

class LoadCocktailEvent extends CocktailEvent{
  final List<Cocktail> cocktails;
  LoadCocktailEvent(this.cocktails);
}
