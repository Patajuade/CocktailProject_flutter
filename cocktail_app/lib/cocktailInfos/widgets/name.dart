
import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  String name;
  Name({required this.name, Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          
        ),
      ),
    );
  }
}