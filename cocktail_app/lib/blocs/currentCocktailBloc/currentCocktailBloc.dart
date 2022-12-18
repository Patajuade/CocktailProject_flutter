// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailEvents.dart';
// import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailStates.dart';
// import 'package:cocktail_app/models/cocktail.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // https://www.folkstalk.com/2022/09/get-one-document-based-on-id-in-firestore-with-code-examples.html
// // https://firebase.google.com/docs/firestore/quickstart
// // https://firebase.google.com/docs/firestore/query-data/get-data

// class CurrentCocktailBloc
//     extends Bloc<CurrentCocktailEvent, CurrentCocktailState> {

//   CurrentCocktailBloc()
//       : super(CurrentCocktailLoadingState()) {
//     on<SetCurrentCocktailEvent>((event, emit) async {
//       var item = FirebaseFirestore.instance
//           .collection("cocktails")
//           .doc(event.id) //pour récupérer 1 document via l'ID
//           .get();
//       var cocktailFuture = await item;
//       var cocktailData = cocktailFuture.data();
//       var cocktail = Cocktail.fromJson(cocktailData!);
//       emit(CurrentCocktailLoadedState(cocktail));
//     });

//     on<ClearCurrentCocktailEvent>((event, emit) async {
//       emit(CurrentCocktailLoadingState());
//     });

//     on<UpdateCurrentCocktailEvent>((event, emit) async {
//       FirebaseFirestore.instance
//           .collection("cocktails")
//           .doc(event.id)
//           .set(event.cocktail.toJson());
//       emit(CurrentCocktailLoadingState());
//     },);
//   }
// }
