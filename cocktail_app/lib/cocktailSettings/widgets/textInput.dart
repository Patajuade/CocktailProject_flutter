import 'package:flutter/material.dart';


class TextInput extends StatefulWidget {
  final TextEditingController controller;
  TextInput(this.controller);

  @override
  State<StatefulWidget> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: widget.controller,
            decoration: const InputDecoration(
              hintText: 'Enter the cocktail name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
