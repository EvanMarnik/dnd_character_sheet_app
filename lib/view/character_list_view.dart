import 'package:flutter/material.dart';

class CharacterListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Character List'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                Navigator.pushNamed(context, sheetRoute, arguments: 0);
              },
              child: const Text('Coddrin Thunderslayer'),
            )
          ],
        )
      ),
    );
  }
}