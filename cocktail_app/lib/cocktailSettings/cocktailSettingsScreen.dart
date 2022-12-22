import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(builder: (context, state) {
      var cocktailId = state.id;

      if (state is CocktailLoadingState ||
          state.cocktail == null ||
          cocktailId == null) {
        context
            .read<CocktailBloc>()
            .add(SetCurrentCocktailEvent(state.id, state.cocktails));
        return const Scaffold(body: Text("Loading"));
      }

      var nameController = TextEditingController();
      var descriptionController = TextEditingController();
      nameController.text=state.cocktail!.name;
      descriptionController.text=state.cocktail!.description;
      return Scaffold(
          persistentFooterButtons: [
            IconButton(
                icon: const Icon(Icons.save),
                color: Colors.black,
                iconSize: 32,
                onPressed: () => {
                      context.read<CocktailBloc>().add(
                          UpdateCurrentCocktailEvent(
                              state.id!,
                              Cocktail(
                                  cocktailPicture: state.cocktail!.cocktailPicture,
                                  description: descriptionController.text,
                                  ingredients: state.cocktail!.ingredients,
                                  name: nameController.text,
                                  tags: state.cocktail!.tags),
                              state.cocktails)),
                      Navigator.pushNamed(context, CocktailInfo.routeName),
                    }),
            const GoToCocktailInfoButton()
          ],
          body: Column(
            children: [
              TextFormField(
                controller: nameController,
              ),
              TextFormField(
                controller: descriptionController,
              )
            ],
          ));
    });
  }
}
