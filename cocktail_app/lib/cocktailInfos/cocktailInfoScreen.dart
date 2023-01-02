import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/header.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/shared/goToCocktailOverview.dart';
import 'package:cocktail_app/shared/goToCocktailSettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailInfo extends StatefulWidget {
  static const routeName =
      '/CocktailInfo'; // appeller la var sans instancier la classe

  const CocktailInfo({super.key});

  @override
  State<CocktailInfo> createState() => _CocktailInfo();
}

class _CocktailInfo extends State<CocktailInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(builder: (context, state) {
      if (state is CocktailLoadingState || state.cocktail == null) {
        return const Scaffold(body: Text("Loading"));
      }
      return Scaffold(
          persistentFooterButtons: const [
            GoToCocktailSettingsButton(),
            GoToCocktailOverviewButton()
          ],
          body: Column(
            children: [
              Header(cocktail: state.cocktail!),
              Description(description: state.cocktail!.description),
              Expanded(child: IngredientsList(cocktail: state.cocktail!))
            ],
          ));
    });
  }
}
