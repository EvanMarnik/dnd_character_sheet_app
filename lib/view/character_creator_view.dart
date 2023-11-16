import 'package:flutter/material.dart';

class CharacterCreatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFAD9090),
          title: const Text('Character Creator'),
        ),
        body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Under Development',
                  style: TextStyle(
                    color: Color(0xFFAD9090),
                  ),
                )
              ]
          )
        )
    );
  }
}