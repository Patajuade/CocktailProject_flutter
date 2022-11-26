import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description(
      {required this.description,
      required this.titleStyle,
      required this.descriptionStyle,
      Key? key});

  final String description;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

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
