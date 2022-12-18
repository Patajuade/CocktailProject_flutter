import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailBloc.dart';
import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailEvents.dart';
import 'package:cocktail_app/blocs/currentCocktailBloc/currentCocktailStates.dart';
import 'package:cocktail_app/cocktailSettings/widgets/saveCocktailButton.dart';
import 'package:cocktail_app/cocktailSettings/widgets/textInput.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/shared/goToCocktailInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailSettings extends StatefulWidget {
  static const routeName =
      '/CocktailSettings'; // appeller la var sans instancier la classe

  const CocktailSettings({super.key});

  @override
  State<CocktailSettings> createState() => _CocktailSettings();
}

class _CocktailSettings extends State<CocktailSettings> {
  late String _cocktailId;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cocktailId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        persistentFooterButtons: [
          SaveCocktailButton(
              _cocktailId,
              Cocktail(
                  cocktailPicture: "",
                  description: descriptionController.text,
                  ingredients: [],
                  tags: [],
                  name: nameController.text)),
          GoToCocktailInfoButton(_cocktailId)
        ],
        body: BlocBuilder<CurrentCocktailBloc, CurrentCocktailState>(
            builder: (context, state) {
          if (state is CurrentCocktailLoadedState) {
            // initialisation des champs via le cocktail courant dans bloc
            nameController.text = state.cocktail?.name ?? "";
            descriptionController.text = state.cocktail?.description ?? "";

            return Column(
              children: [
                TextInput(nameController),
                TextInput(descriptionController)
              ],
            );
          }
          context
              .read<CurrentCocktailBloc>()
              .add(SetCurrentCocktailEvent(_cocktailId));
          return Text("Loading");
        }));
  }
}
