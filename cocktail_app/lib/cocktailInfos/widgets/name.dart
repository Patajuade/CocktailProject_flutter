
import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  String name;
  Name({required this.name, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          
        ),
      ),
    );
  }
}