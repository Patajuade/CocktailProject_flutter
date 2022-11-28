import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailOverview extends StatelessWidget {
  final FirebaseFirestore db= FirebaseFirestore.instance;
  late Stream<QuerySnapshot> cocktailCollection;
  
  CocktailOverview({super.key});
  
  @override
  Widget build(BuildContext context) {
    cocktailCollection = db.collection("cocktails").snapshots();
    return 
    Scaffold(
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
            return ListTile(
              title: Text(data['name']),
              onTap: () {
                Navigator.pushNamed(context,
                CocktailInfo.routeName,
                arguments: Cocktail(
                  description: data['description'], 
                  name: data['name'], 
                  id: data['id'], 
                  //ingredients: data['ingredients'], 
                  cocktailPicture: data['cocktailPicture'], 
                  //tags: data['tags'],
                  ingredients: [], tags:[]
                  ) 
                  );
              },
              leading: Image(
            image: NetworkImage(data['cocktailPicture']),
            height: 40,
            width: 40,
          ),
            );
          }
        ).toList(),
      );
    }
  )
  );

}
}