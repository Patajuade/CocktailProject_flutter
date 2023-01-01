import 'package:cocktail_app/blocs/cocktailBloc/cocktailBloc.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailEvents.dart';
import 'package:cocktail_app/blocs/cocktailBloc/cocktailStates.dart';
import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/cocktailInfos/widgets/ingredients.dart';
import 'package:cocktail_app/cocktailSettings/widgets/removableListview.dart';
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
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
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

      final addIngredientController = TextEditingController();
      final addTagController = TextEditingController();

      if(nameController.text.isEmpty){
      nameController.text = state.cocktail!.name;
      }
      if(descriptionController.text.isEmpty){
      descriptionController.text = state.cocktail!.description;
      }

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
                    decoration: const InputDecoration(labelText: "Description"),
                    controller: descriptionController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Add ingredient"),
                    controller: addIngredientController,
                  ),
                  IconButton(
                    onPressed: (() {
                      return context.read<CocktailBloc>().add(
                          AddIngredientToCocktailEvent(
                              //TODO : add specific event
                              state.id!,
                              addIngredientController.text,
                              state.cocktail,
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
                      maxHeight: 100, //pour éviter qu'lle s'étende
                    ),
                    child: RemovableListview(
                        items: state.cocktail!.ingredients,
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
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Add tag"),
                    controller: addTagController,
                  ),
                  IconButton(
                    onPressed: (() {
                      return context.read<CocktailBloc>().add(
                          AddTagToCocktailEvent(
                              state.id!,
                              addTagController.text,
                              state.cocktail,
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
                      maxHeight: 200, //pour éviter qu'lle s'étende
                    ),
                    child: RemovableListview(
                        items: state.cocktail!.tags,
                        onPressed: ((tagName) => {
                              context.read<CocktailBloc>().add(
                                  UpdateCurrentCocktailEvent(
                                      state.id!,
                                      Cocktail(
                                          cocktailPicture:
                                              state.cocktail!.cocktailPicture,
                                          description:
                                              state.cocktail!.description,
                                          tags: state.cocktail!.tags
                                              .where((element) =>
                                                  element != tagName)
                                              .toList(),
                                          name: state.cocktail!.name,
                                          ingredients:
                                              state.cocktail!.ingredients),
                                      state.cocktails))
                            })),
                  ),
                ],
              )));
    });
  }
}
