import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailOverview extends StatefulWidget {

  const CocktailOverview({super.key});

  @override
  State<CocktailOverview> createState() => _CocktailOverview();
}

class _CocktailOverview extends State<CocktailOverview> {
  late CocktailState _state;

  @override
  void initState() {
    super.initState();
    _state = CocktailState(FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _state.cocktails,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  var id = document.id;
                  var data = document.data() as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['name']),
                    onTap: () {
                      Navigator.pushNamed(context, CocktailInfo.routeName,
                          arguments: Cocktail.fromJson(data,id));
                    },
                    leading: Image(
                      image: NetworkImage(data['cocktailPicture']),
                      height: 40,
                      width: 40,
                    ),
                  );
                }).toList(),
              );
            }));
  }
}