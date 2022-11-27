import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/header.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailInfo extends StatelessWidget {
  final FirebaseFirestore db= FirebaseFirestore.instance;
  late Stream<QuerySnapshot> cocktailCollection;
  
  CocktailInfo({super.key});
  
  @override
  Widget build(BuildContext context) {
    cocktailCollection = db.collection("cocktails").snapshots();
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
    stream:cocktailCollection,
    builder:(context, snapshot) {
      if (snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Text("Loading");
      }
      return ListView(
        children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
            var data = document.data() as Map<String,dynamic>;
            print(data);
            return ListTile(
              title: Text(data['description'])

            );
          }
        ).toList(),
      );
    }
  )
  );

  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         Header(cocktail: cocktail),
  //         Description(
  //           description: cocktail.description,
  //           key: key,
  //         ),
  //         IngredientsList(cocktail: cocktail, key: key)
  //       ],
  //     ),
  //   );
  // }
}
}