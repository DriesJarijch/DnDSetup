import 'package:flutter/material.dart';
import 'package:flutter_charactermancer/character.dart';
import '../boxes.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterReorder();
}

class _CharacterReorder extends State<CharacterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Characters'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                int len = boxCharacters.length;
                //print(len);
                for (int index = 0; index < len; index++) {
                  //print(boxCharacters.getAt(0).name);
                  boxCharacters.deleteAt(0);
                }
                setState(() {});
              },
              child: const Text('Empty database')),
          ElevatedButton(
              onPressed: () {
                boxCharacters.values
                    .where((char) => char.level == 1)
                    .forEach((char) => print(char.name));
              },
              child: const Text('do a query')),
          Expanded(
            child: ReorderableListView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: <Widget>[
                for (int index = 0; index < boxCharacters.length; index++)
                  ListTile(
                    key: Key('$index'),
                    title: Text('${boxCharacters.getAt(index).name}'),
                  )
              ],
              onReorder: (int oldI, int newI) {
                setState(() {
                  if (oldI < newI) {
                    final Character char1 = boxCharacters.getAt(oldI);
                    newI--;
                    for(int i = 0; i < newI-oldI;i++) {
                      final Character tempchar = boxCharacters.getAt(oldI+1+i);
                      boxCharacters.putAt(oldI+i, tempchar);
                    }
                    boxCharacters.putAt(newI, char1);
                  } else {
                    final Character char1 = boxCharacters.getAt(oldI);
                    for(int i = 0; i < oldI-newI;i++) {
                      final Character tempchar = boxCharacters.getAt(oldI-1-i);
                      boxCharacters.putAt(oldI-i, tempchar);
                    }
                    boxCharacters.putAt(newI, char1);
                  }
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Enter Your characters' name"),
                  content: Text('Dropdown'),
                );
              });
          boxCharacters.put('${boxCharacters.length}',
              Character(name: 'hans ${boxCharacters.length}', level: 2, stats: [8,8,8,8,8,8]));
          print(boxCharacters.length);
          setState(() {});
        },
        tooltip: 'Add new Character',
        child: const Icon(Icons.add),
      ),
    );
  }
}
