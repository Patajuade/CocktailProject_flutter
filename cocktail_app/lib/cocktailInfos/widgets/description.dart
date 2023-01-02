import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description({required this.description, Key? key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        width: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: Text(
          'Description',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.165),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ]),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Text(description,
                      style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.secondary ),
                      textAlign: TextAlign.justify))))
    ]);
  }
}
