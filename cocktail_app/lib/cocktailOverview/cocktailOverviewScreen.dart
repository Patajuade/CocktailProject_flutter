import 'dart:async';

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
  Timer? _debounce;
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

      _onSearchChanged(String query) {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          context
              .read<CocktailBloc>()
              .add(FilterCocktailListEvent(query,state.id, state.cocktail));
        });

      }

      @override
      void dispose() {
        _debounce?.cancel();
        super.dispose();
      }

      return Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                  width: 350,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: TextFormField(
                    onChanged: _onSearchChanged,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: " Search...(tags, ingredients, name)",
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                  )),
            ],
            automaticallyImplyLeading: false,
            leading: const Icon(Icons.search),
            backgroundColor: Colors.deepOrange,
          ),
          persistentFooterButtons: [
            IconButton(
                onPressed: () {
                  setState(() {
                    context
                        .read<CocktailBloc>()
                        .add(AddNewCocktailEvent(cocktails));
                    context
                        .read<CocktailBloc>()
                        .add(LoadCocktailListEvent(state.id, state.cocktail));
                  });
                },
                icon: const Icon(Icons.add_circle))
          ],
          body: cocktails != null && cocktails.isNotEmpty? ListView(
            children: cocktails.map((document) {
              var id = document.id;
              var data = document.data();
              return Tile(Cocktail.fromJson(data), id);
            }).toList(),
          ):const Text("nothing found"));
    });
  }
}
