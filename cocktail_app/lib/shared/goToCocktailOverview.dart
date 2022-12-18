import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailOverview/cocktailOverviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoToCocktailOverviewButton extends StatelessWidget {
  GoToCocktailOverviewButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(
        builder: (context, state) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              iconSize: 32,
              onPressed: () => {
                    context
                        .read<CocktailBloc>()
                        .add(ClearCurrentCocktailEvent()),
                    Navigator.pushNamed(context, CocktailOverview.routeName)
                  }));
    });
  }
}
