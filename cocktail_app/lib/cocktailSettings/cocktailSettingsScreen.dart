import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/cocktailSettings/widgets/removableIngredients.dart';
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
      var addIngredientController = TextEditingController();
      nameController.text = state.cocktail!.name;
      descriptionController.text = state.cocktail!.description;

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
                                  cocktailPicture:
                                      state.cocktail!.cocktailPicture,
                                  description: descriptionController.text,
                                  ingredients: state.cocktail!.ingredients,
                                  name: nameController.text,
                                  tags: state.cocktail!.tags),
                              state.cocktails)),
                      Navigator.pushNamed(context, CocktailInfo.routeName),
                    }),
            const GoToCocktailInfoButton()
          ],
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Name"),
                    controller: nameController,
                  ),
                  TextFormField(
                    controller: descriptionController,
                  ),
                  TextFormField(
                    controller: addIngredientController,
                  ),
                  IconButton(
                    onPressed: (() {
                      var ingredientList = state.cocktail!.ingredients;
                      ingredientList.add(addIngredientController.text);
                              return context.read<CocktailBloc>().add(
                                  UpdateCurrentCocktailEvent(
                                      state.id!,
                                      Cocktail(
                                          cocktailPicture:
                                              state.cocktail!.cocktailPicture,
                                          description:
                                              state.cocktail!.description,
                                          ingredients: ingredientList,
                                          name: state.cocktail!.name,
                                          tags: state.cocktail!.tags),
                                      state.cocktails));
                            }),
                    icon: const Icon(Icons.add_circle),
                    color: Colors.green,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                      maxWidth: double.infinity,
                      minHeight: 0,
                      maxHeight: 400, //pour éviter qu'lle s'étende
                    ),
                    child: RemovableIngredients(
                        ingredients: state.cocktail!.ingredients,
                        onPressed: ((ingredientName) => {
                              context.read<CocktailBloc>().add(
                                  UpdateCurrentCocktailEvent(
                                      state.id!,
                                      Cocktail(
                                          cocktailPicture:
                                              state.cocktail!.cocktailPicture,
                                          description:
                                              state.cocktail!.description,
                                          ingredients: state
                                              .cocktail!.ingredients
                                              .where((element) =>
                                                  element != ingredientName)
                                              .toList(),
                                          name: state.cocktail!.name,
                                          tags: state.cocktail!.tags),
                                      state.cocktails))
                            })),
                  ),
                ],
              )));
    });
  }
}
