import 'package:cocktail_app/models/cocktail.dart';

class CurrentCocktailState {
  late Cocktail? cocktail;
  CurrentCocktailState(this.cocktail);
}

class CurrentCocktailLoadedState extends CurrentCocktailState{
  CurrentCocktailLoadedState(Cocktail cocktail) : super(cocktail);
}

class CurrentCocktailLoadingState extends CurrentCocktailState{
  CurrentCocktailLoadingState() : super(null);
}