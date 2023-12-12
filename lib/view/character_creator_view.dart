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
  List<String> classList = ['Barbarian','Bard','Cleric','Druid','Fighter','Monk','Paladin','Ranger','Rogue','Sorcerer','Warlock','Wizard'];
  List<String> raceList = ['Dragonborn','Dwarf','Elf','Gnome','Half Elf','Halfling','Half Orc','Human','Tiefling'];
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
                    classList.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                initialSelection: classList.first,

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
                    raceList.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                    initialSelection: raceList.first,

                    menuStyle: MenuStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFAD9090))
                    ),
                  )
            ])));
  }
}
