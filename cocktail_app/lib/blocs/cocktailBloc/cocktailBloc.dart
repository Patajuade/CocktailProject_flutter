import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrimesBloc extends Bloc<CocktailEvent, CocktailState> {
  CrimesBloc(List<Cocktail> cocktails) : super(CocktailState(cocktails)) {

    on<AddCocktailEvent>((event, emit) {
      List<Cocktail> cocktails = List.from(state.cocktails);
      cocktails.add(event.cocktail);
      emit(CocktailState(cocktails));
    });

    on<RemoveCocktailEvent>((event, emit) {
      List<Cocktail> cocktails = List.from(state.cocktails);
      cocktails.remove(event.cocktail);
      emit(CocktailState(cocktails));
    });

    on<UpdateCocktailEvent>((event, emit) {
      emit(CocktailState(state.cocktails));
    });
    
  }
}
