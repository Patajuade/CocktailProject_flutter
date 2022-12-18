import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/cocktailOverview/widgets/tile.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailOverview extends StatefulWidget {
  static const routeName =
      '/CocktailOverview'; // appeller la var sans instancier la classe

  const CocktailOverview({super.key});

  @override
  State<CocktailOverview> createState() => _CocktailOverview();
}

class _CocktailOverview extends State<CocktailOverview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(builder: (context, state) {
      if (state is CocktailLoadingState) {
        context
            .read<CocktailBloc>()
            .add(LoadCocktailListEvent(state.id, state.cocktail));
        return const Scaffold(body: Text("Loading"));
        //TODO : LoadingScreen
      } //si il a pas reussi à charger le state
      var cocktails = state.cocktails;
        if (cocktails == null || cocktails.isEmpty) {
          return const Scaffold(body: Text("Empty list"));
          //TODO: rediriger sur la addCocktailScreen
        }
        return Scaffold(
            body: ListView(
          children: cocktails.map((document) {
            var id = document.id;
            var data = document.data();
            return Tile(Cocktail.fromJson(data), id);
          }).toList(),
        ));
    });
  }
}