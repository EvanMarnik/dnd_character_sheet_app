import 'package:flutter/material.dart';

import 'package:dnd_character_sheet_app/constants.dart';

class CharacterListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Character',
              style: TextStyle(
                color: Color(0xFFAD9090),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, sheetRoute, arguments: 0);
                    },
                    child: const Text(
                        'Coddrin Thunderslayer\nHalf-Orc\nBarbarian\nFolk Hero',
                        textAlign: TextAlign.center
                    ),
                  ),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 350,
                  child: FilledButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, creatorRoute, arguments: null);
                    },
                    child: const Text('Create Character'),
                  )
                )
              ]
            ),
          ]
        )
      ),
    );
  }
}