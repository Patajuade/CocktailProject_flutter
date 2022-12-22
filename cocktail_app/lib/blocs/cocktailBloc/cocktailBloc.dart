import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://www.folkstalk.com/2022/09/get-one-document-based-on-id-in-firestore-with-code-examples.html
// https://firebase.google.com/docs/firestore/quickstart
// https://firebase.google.com/docs/firestore/query-data/get-data

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
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
            .doc(event.id)
            .set(event.cocktail.toJson());
        emit(CocktailLoadedState(cocktailList, cocktail, cocktailId));
      },
    );
  }
}
