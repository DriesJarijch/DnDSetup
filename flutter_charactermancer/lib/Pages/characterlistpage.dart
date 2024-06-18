import 'package:flutter/material.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to the Charactermancer!'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
