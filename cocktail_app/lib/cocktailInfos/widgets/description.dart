import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description(
      {required this.description,
      Key? key});

  final String description;
  final TextStyle titleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle descriptionStyle = const TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Container(
        width: double.infinity,
        child: Text(
        'Description',
        style: titleStyle,
        textAlign: TextAlign.left,
      ),
      ),
        Text(
          description,
          style: descriptionStyle,
        ),
    ]);
  }
}
