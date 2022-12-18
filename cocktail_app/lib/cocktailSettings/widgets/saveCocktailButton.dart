import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
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
        child: BlocBuilder<CocktailBloc, CocktailState>(
            builder: (context, state) {
          return IconButton(
                icon: const Icon(Icons.save),
                color: Colors.black,
                iconSize: 32,
                onPressed: () {
                  Navigator.pushNamed(context,CocktailInfo.routeName,arguments: cocktailId);
                  context.read<CocktailBloc>().add(UpdateCurrentCocktailEvent(cocktailId, cocktail));
                } );
        }));
  }
}
