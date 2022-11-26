
import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  String? name;
  Name(this.name, Key? key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        name??'No name found',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}