import 'package:cocktail_app/cocktailInfos/cocktailInfoScreen.dart';
import 'package:cocktail_app/cocktailOverview/cocktailOverviewScreen.dart';
import 'package:cocktail_app/cocktailSettings/cocktailSettingsScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CocktailInfo.routeName: (context) => const CocktailInfo(),
        CocktailOverview.routeName: (context) => const CocktailOverview(),
        CocktailSettings.routeName: (context) => const CocktailSettings()
        // "/CocktailInfo" : (context) => CocktailInfo()
      },
      title: 'Cocktail App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CocktailOverview(),
    );
  }
}