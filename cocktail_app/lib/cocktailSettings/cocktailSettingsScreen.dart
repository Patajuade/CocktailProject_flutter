import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/shared/goToCocktailInfo.dart';
import 'package:cocktail_app/shared/goToCocktailOverview.dart';
import 'package:flutter/material.dart';

class CocktailSettings extends StatefulWidget {
  static const routeName = '/CocktailSettings'; // appeller la var sans instancier la classe

  const CocktailSettings({super.key});

  @override
  State<CocktailSettings> createState() => _CocktailSettings();
}

class _CocktailSettings extends State<CocktailSettings> {
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
        GoToCocktailInfoButton(cocktailId: cocktailId)

      ],
        body: FutureBuilder<Cocktail>( //pour afficher un cocktail de façon asynchrone depuis la db
      future: _cocktail,
      builder: (context, snapshot) => snapshot.hasData
          ? Column(
              children: [
                Text(snapshot.data!.name)
              ],
            )
          : Text("error"), //ternaire
    ));
  }
}
