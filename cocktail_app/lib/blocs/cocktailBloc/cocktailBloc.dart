import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://www.folkstalk.com/2022/09/get-one-document-based-on-id-in-firestore-with-code-examples.html
// https://firebase.google.com/docs/firestore/quickstart
// https://firebase.google.com/docs/firestore/query-data/get-data

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  CocktailBloc(CocktailState state) : super(state) {

    on<AddCocktailEvent>((event, emit) {
      //state.cocktails.add(event.cocktail);
      emit(state);
    });

    on<RemoveCocktailEvent>((event, emit) {
      //state.cocktails.doc(event.cocktail.id).delete();
      emit(state);
    });

    on<UpdateCocktailEvent>((event, emit) {
      emit(state);
    });

    on<LoadCocktailEvent>((event, emit) {
      emit(state);
    });

  }
}
