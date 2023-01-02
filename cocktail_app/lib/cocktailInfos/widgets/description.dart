import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description({required this.description, Key? key});

  final String description;
  final TextStyle titleStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  final TextStyle descriptionStyle = const TextStyle(fontSize: 14);
  final MaterialColor mainColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        width: double.infinity,
        color: mainColor.shade200,
        child: Text(
          'Description',
          style: titleStyle,
          textAlign: TextAlign.left,
        ),
      ),
      Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 202, 202, 202),
              offset: Offset(
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
                  color: mainColor.shade50,
                  child: Text(description,
                      style: descriptionStyle, textAlign: TextAlign.justify))))
    ]);
  }
}
