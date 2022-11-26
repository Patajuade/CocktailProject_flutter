import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String? description;
  Description(this.description, Key? key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        description??'No description found',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}