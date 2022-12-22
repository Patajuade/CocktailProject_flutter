import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoToCocktailInfoButton extends StatelessWidget {
  const GoToCocktailInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(builder: (context, state) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 32,
              onPressed: () =>
                  {Navigator.pushNamed(context, CocktailInfo.routeName)}));
    });
  }
}
