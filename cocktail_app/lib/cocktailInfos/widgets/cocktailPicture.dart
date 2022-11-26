
import 'package:flutter/material.dart';

class CocktailPicture extends StatelessWidget {
  final String? cocktailPicture;
  CocktailPicture(this.cocktailPicture, Key? key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        cocktailPicture??'No picture found',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}


//how to include images in your app
//https://flutter.dev/docs/cookbook/images/network-image

//assets folder in the same directory as the pubspec.yaml file
//create assets/images folder
//open pubspec.yaml file
//add the following line to the assets section
//assets:
//  - assets/images/image.jpg