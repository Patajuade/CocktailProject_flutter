import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailBloc.dart';
import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailEvents.dart';
import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCocktailButton extends StatelessWidget {
  final String cocktailId;
  final Cocktail cocktail;

  SaveCocktailButton(this.cocktailId, this.cocktail);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<CurrentCocktailBloc, CurrentCocktailState>(
            builder: (context, state) {
          return IconButton(
                icon: const Icon(Icons.save),
                color: Colors.black,
                iconSize: 32,
                onPressed: () {
                  Navigator.pushNamed(context,CocktailInfo.routeName,arguments: cocktailId);
                  context.read<CurrentCocktailBloc>().add(UpdateCocktailEvent(cocktailId, cocktail));
                } );
        }));
  }
}
