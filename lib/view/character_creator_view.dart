import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

class CharacterCreatorView extends StatefulWidget {
  CharacterListViewModel characterListViewModel;

  CharacterCreatorView(this.characterListViewModel);

  @override
  State<CharacterCreatorView> createState() => _CharacterCreatorViewState(
      characterListViewModel: characterListViewModel);
}

class _CharacterCreatorViewState extends State<CharacterCreatorView> {
  CharacterListViewModel characterListViewModel;

  _CharacterCreatorViewState({required this.characterListViewModel});
  String value = "";
  List<String> list = <String>['Barbarian', 'Bard', 'Cleric', 'Druid'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFAD9090),
          title: const Text('Character Creator',
              style: TextStyle(color: const Color(0xFF302727))),
        ),
        body: Center(

            child: Column(
                children: <Widget>[
                  const Text(
                    'Select Class',
                    style: TextStyle(
                      color: Color(0xFFAD9090),
                    ),
                  ),
              DropdownMenu(

                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                initialSelection: list.first,

                menuStyle: MenuStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFAD9090))
                ),
              ),
                  const Text(
                    'Select Race',
                    style: TextStyle(
                      color: Color(0xFFAD9090),
                    ),
                  ),
                  DropdownMenu(

                    dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                    initialSelection: list.first,

                    menuStyle: MenuStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFAD9090))
                    ),
                  )
            ])));
  }
}
