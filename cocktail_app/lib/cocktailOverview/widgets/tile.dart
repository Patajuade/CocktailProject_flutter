import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tile extends StatefulWidget {
  final Cocktail _cocktail;
  final String _cocktailId;
  const Tile(this._cocktail, this._cocktailId);
  @override
  State<StatefulWidget> createState() => _Tile();
}

class _Tile extends State<Tile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(Object context) { //widget. => correspond au state en haut de l'écran (Tile)
    return BlocBuilder<CocktailBloc, CocktailState>(builder: (context, state) {
      return ListTile(
        title: Text(widget._cocktail.name),
        onTap: () {
          context.read<CocktailBloc>().add(
              SetCurrentCocktailEvent(widget._cocktailId, state.cocktails));
          Navigator.pushNamed(context, CocktailInfo.routeName);
        },
        leading: Image(
          //premier élément, pour le mettre tout à gauche
          image: NetworkImage(widget._cocktail.cocktailPicture),
          height: 40,
          width: 40,
        ),
      );
    });
  }
}
