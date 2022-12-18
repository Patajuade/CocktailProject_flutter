import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/models/cocktail.dart';

class CocktailState {
  late List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails;
  late Cocktail? cocktail;
  late String? id;
  CocktailState(this.cocktails, this.cocktail, this.id);
}

class CocktailLoadingState extends CocktailState {
  CocktailLoadingState(
      List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails,
      Cocktail? cocktail,
      String? id)
      : super(cocktails, cocktail, id);
}

class CocktailLoadedState extends CocktailState {
  CocktailLoadedState(
      List<QueryDocumentSnapshot<Map<String, dynamic>>>? cocktails,
      Cocktail? cocktail,
      String? id)
      : super(cocktails, cocktail, id);
}