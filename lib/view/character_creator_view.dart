import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

class CharacterCreatorView extends StatefulWidget {
  CharacterListViewModel characterListViewModel;

  CharacterCreatorView(this.characterListViewModel);

  @override
  State<CharacterCreatorView> createState() => _CharacterCreatorViewState(characterListViewModel: characterListViewModel);
}

class _CharacterCreatorViewState extends State<CharacterCreatorView> {
  CharacterListViewModel characterListViewModel;

  _CharacterCreatorViewState({required this.characterListViewModel});

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