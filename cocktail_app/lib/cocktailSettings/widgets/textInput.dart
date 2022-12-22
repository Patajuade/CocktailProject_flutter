import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final String? defaultValue;
  final void Function(String)? onChanged;
  TextInput({this.onChanged, this.defaultValue, super.key});

  @override
  State<StatefulWidget> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.defaultValue ?? "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            // onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: const InputDecoration(
              hintText: 'Enter the cocktail name',
            ),
            // validator: (String? value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
          ),
        ),
      ],
    );
  }
}
