import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/widgets/description.dart';
import 'package:cocktail_app/cocktailInfos/widgets/header.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/shared/goToCocktailOverview.dart';
import 'package:cocktail_app/shared/goToCocktailSettings.dart';
import 'package:flutter/material.dart';

class CocktailInfo extends StatefulWidget {
  static const routeName = '/CocktailInfo'; // appeller la var sans instancier la classe

  const CocktailInfo({super.key});

  @override
  State<CocktailInfo> createState() => _CocktailInfo();
}

class _CocktailInfo extends State<CocktailInfo> {
  late CocktailState _state;
  late String cocktailId;
  late Future<Cocktail> _cocktail = Future<Cocktail>.sync(() {
    return _state.getCocktailById(cocktailId);
  });

  @override
  void initState() {
    super.initState();
    _state = CocktailState(FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    cocktailId = ModalRoute.of(context)!.settings.arguments as String; //pour recupérer les arguments de la navigation de cocktailOverviewScreen

    return Scaffold(
      persistentFooterButtons: [
        GoToCocktailOverviewButton(),
        GoToCocktailSettingsButton(cocktailId)
      ],
        body: FutureBuilder<Cocktail>( //pour afficher un cocktail de façon asynchrone depuis la db
      future: _cocktail,
      builder: (context, snapshot) => snapshot.hasData
          ? Column(
              children: [
                Header(cocktail: snapshot.data!),
                Description(description: snapshot.data!.description),
                IngredientsList(cocktail: snapshot.data!)
              ],
            )
          : Text("error"), //ternaire
    ));
  }
}
