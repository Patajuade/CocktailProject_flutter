import 'package:flutter/material.dart';

class RemovableListview extends StatelessWidget {
  final List<String> items;
  final Function(String item) onPressed;
  const RemovableListview( {required this.items, required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: items.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 50,
            child: Center(
              child: Row(children: [
                Text(
                  items[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                 IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Colors.red,
                iconSize: 32,
                onPressed: ()=> onPressed(items[index]),  
                    ),
              ]),
            ),
          );
        });
  }
}
