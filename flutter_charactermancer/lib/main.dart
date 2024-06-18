import 'package:flutter/material.dart';
import 'package:flutter_charactermancer/character.dart';
import 'boxes.dart';
import 'package:hive_flutter/adapters.dart';
import 'Pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  boxCharacters = await Hive.openBox<Character>('charbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charactermancer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
