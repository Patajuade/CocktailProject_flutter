import 'dart:html';

import 'package:flutter/material.dart';

class RemovableListview extends StatelessWidget {
  final List<String> items;
  final Function(String item) onPressed;
  const RemovableListview(
      {required this.items, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).colorScheme.surface,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.165),
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            ),
      ]),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          prototypeItem: const ListTile(
            title: Center(
                child: Text(
                    "Ingredients")), //sert à prévenir le ListView de ce à quoi va ressembler la Tile même s'il n'a pas encore d'ingrédents. On aurait pu mettre un string vide.
          ),
          // separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => onPressed(items[index]),
              ),
              title: Center(
                child: Row(children: [
                  Text(
                    items[index],
                    style: TextStyle(color:Theme.of(context).colorScheme.onBackground),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
