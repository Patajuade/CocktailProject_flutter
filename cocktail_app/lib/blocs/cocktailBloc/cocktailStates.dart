import 'package:cloud_firestore/cloud_firestore.dart';

class CocktailState {
  final FirebaseFirestore _db;
  final Stream<QuerySnapshot> _cocktails;

  CocktailState(this._db)
      : _cocktails = _db.collection("cocktails").snapshots();

  Stream<QuerySnapshot> get cocktails {
    return _cocktails;
  }
}
