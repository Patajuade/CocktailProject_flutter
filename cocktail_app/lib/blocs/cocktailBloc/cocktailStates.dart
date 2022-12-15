import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/models/cocktail.dart';

class CocktailState {
  final FirebaseFirestore _db;
  final CollectionReference<Map<String, dynamic>> _cocktails;

  CocktailState(this._db)
      : _cocktails = _db.collection("cocktails");

  Stream<QuerySnapshot> get cocktails {
    return _cocktails.snapshots();
  }
  Future<Cocktail> getCocktailById(String id) async{
    var cocktail = await _cocktails.doc(id).get();
    if (cocktail==null)throw Error();
    return Cocktail.fromJson(cocktail.data()!); 
  }
  //aller mettre ça dans les blocs
  //le fait de chercher la liste doit être dans le bloc
  //le state doit être clean
  // c'est pas ans state c'est dans bloc
  // on<addCocktailEvent>((event, emit)=>
  // cocktail = event.cocktail
  // await FirebaseFirestore.instance.collection('cocktails').add(cocktail.toJson());
  // emit(state([state.cocktails, cocktail]))
}
