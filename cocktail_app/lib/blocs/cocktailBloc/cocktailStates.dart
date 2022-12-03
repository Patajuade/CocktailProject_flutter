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

}
