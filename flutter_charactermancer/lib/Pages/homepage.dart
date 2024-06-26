import 'package:flutter/material.dart';
import 'characterlistpage.dart';
import 'spelllistpage.dart';
import '../boxes.dart';
import 'package:flutter_charactermancer/character.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to the Charactermancer!'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CharacterListPage()));
                  },
                  child: const Text('My characters')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('Spell list editor');
                  },
                  child: const Text('Spell list editor')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    boxCharacters.put(
                        '${boxCharacters.length}',
                        Character(
                            name: 'hans ${boxCharacters.length}', level: 1, stats: [8,8,8,8,8,8]));
                    print(boxCharacters.length);
                  },
                  child: const Text('Feat editor')),
            )
          ],
        ),
      ),
    );
  }
}
