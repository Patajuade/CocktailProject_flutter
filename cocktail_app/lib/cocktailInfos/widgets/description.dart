import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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