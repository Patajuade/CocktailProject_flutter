import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://www.folkstalk.com/2022/09/get-one-document-based-on-id-in-firestore-with-code-examples.html
// https://firebase.google.com/docs/firestore/quickstart
// https://firebase.google.com/docs/firestore/query-data/get-data

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> { // manipuler les datas
  CocktailBloc() : super(CocktailLoadingState(null, null, null)) {

    on<LoadCocktailListEvent>((event, emit) async {
      var cocktail = event.cocktail;
      var cocktailId = event.id;
      var items = FirebaseFirestore.instance
          .collection("cocktails")
          .get(); //pour récupérer tous les documents
      var cocktailsFuture = await items;
      var cocktailsData = cocktailsFuture.docs;
      emit(CocktailLoadedState(cocktailsData, cocktail, cocktailId));
    });

    on<SetCurrentCocktailEvent>((event, emit) async {
      var cocktailList = event.cocktails;
      var cocktailId = event.id;
      var item = FirebaseFirestore.instance
          .collection("cocktails")
          .doc(event.id) //pour récupérer 1 document via l'ID
          .get();
      var cocktailFuture = await item;
      var cocktailData = cocktailFuture.data();
      var cocktail = Cocktail.fromJson(cocktailData!);
      emit(CocktailLoadedState(cocktailList, cocktail, cocktailId));
    });

    on<ClearCurrentCocktailEvent>((event, emit) async {
      emit(CocktailLoadingState(null, null, null));
    });

    on<UpdateCurrentCocktailEvent>(
      (event, emit) async {
        var cocktail = event.cocktail;
        var cocktailList = event.cocktails;
        var cocktailId = event.id;
        FirebaseFirestore.instance
            .collection("cocktails")
            .doc(cocktailId)
            .set(cocktail.toJson());
        emit(CocktailLoadedState(cocktailList, cocktail, cocktailId));
      },
    );

    on<AddNewCocktailEvent>(
      (event, emit) async {
        var cocktail = const Cocktail(
            cocktailPicture:
                "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
            description: "",
            ingredients: [],
            tags: [],
            name: "New Cocktail");
        var cocktailList = event.cocktails;
        FirebaseFirestore.instance
            .collection("cocktails")
            .doc()
            .set(cocktail.toJson());
        emit(CocktailLoadingState(null, null, null));
      },
    );

    on<FilterCocktailListEvent>(
      (event, emit) async {
        var cocktail = event.cocktail;
        var cocktailId = event.id;
        var refs = FirebaseFirestore.instance.collection("cocktails");
        // pas possible d'utiliser where pour la searchbar + flemme d'utiliser un service externe (elastique,algolia,...)
        var cocktailsRefs = await refs.get();
        var cocktailsData = cocktailsRefs.docs;
        var filter = event.filter.toLowerCase();
        var filteredData = cocktailsData.where((cocktail) =>
            cocktail.get("name").toString().toLowerCase().contains(filter) ||
            cocktail.get('tags').toString().toLowerCase().contains(filter) ||
            cocktail.get('ingredients').toString().toLowerCase().contains(filter));
        emit(CocktailLoadedState(filteredData.toList(), cocktail, cocktailId));
      },
    );

    on<AddTagToCocktailEvent>(
      (event, emit) async {
        var cocktail = event.cocktail;
        var cocktailList = event.cocktails;
        var cocktailId = event.id;
        var tag = event.tag;
        cocktail!.tags.add(tag);
        FirebaseFirestore.instance
            .collection("cocktails")
            .doc(event.id)
            .update({"tags":FieldValue.arrayUnion(cocktail.tags)}); //https://firebase.google.com/docs/firestore/manage-data/add-data#update_elements_in_an_array
        emit(CocktailLoadedState(cocktailList, cocktail, cocktailId));
      },
    );

    on<AddIngredientToCocktailEvent>(
      (event, emit) async {
        var cocktail = event.cocktail;
        var cocktailList = event.cocktails;
        var cocktailId = event.id;
        var ingredient = event.ingredient;
        cocktail!.ingredients.add(ingredient);
        FirebaseFirestore.instance
            .collection("cocktails")
            .doc(event.id)
            .update({"ingredients":FieldValue.arrayUnion(cocktail.ingredients)}); //https://firebase.google.com/docs/firestore/manage-data/add-data#update_elements_in_an_array
        emit(CocktailLoadedState(cocktailList, cocktail, cocktailId));
      },
    );
  }
}
