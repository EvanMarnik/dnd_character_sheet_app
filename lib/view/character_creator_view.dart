import 'dart:ffi';

import 'package:dnd_character_sheet_app/model/spell.dart';
import 'package:dnd_character_sheet_app/view_model/character_creator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';
import 'package:dnd_character_sheet_app/view/character_list_view.dart';
import 'package:flutter/services.dart';
import '../model/character_model.dart';
import '../model/character_option.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CharacterCreatorView extends StatefulWidget {
  CharacterListViewModel characterListViewModel;

  CharacterCreatorView(this.characterListViewModel);

  @override
  State<CharacterCreatorView> createState() => _CharacterCreatorViewState(
      characterListViewModel: characterListViewModel);
}

class _CharacterCreatorViewState extends State<CharacterCreatorView> {
  CharacterListViewModel characterListViewModel;
  late CharacterCreatorViewModel vm;

  _CharacterCreatorViewState({required this.characterListViewModel});

  @override
  void initState() {
    super.initState();
    vm = CharacterCreatorViewModel(
        characterListViewModel: characterListViewModel);
  }

  CharacterOption? selectedClass = barbarian;
  CharacterOption? selectedRace = dragonborn;
  CharacterOption? selectedBG = acolyte;
  String selectedName = "";
  List<CharacterOption> classList = classes;
  List<CharacterOption> raceList = races;
  List<CharacterOption> backgroundList = backgrounds;
  int strength = 10;
  int dexterity = 10;
  int constitution = 10;
  int intelligence = 10;
  int wisdom = 10;
  int charisma = 10;
  List<Spell>? selectedCantrips;
  List<Spell>? selectedFirstLevel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFFAD9090),
        appBar: AppBar(
          backgroundColor: Color(0xFF302727),
          title: const Text('Character Creator',
              style: TextStyle(color: const Color(0xFFAD9090))),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  iconColor: Color(0xFFAD9090),
                  contentPadding: EdgeInsets.symmetric(horizontal: 40)),
              onChanged: (text) {
                selectedName = text;
              }),
          const Text(
            'Select Class',
            style: TextStyle(
              color: Color(0xFF302727),
            ),
          ),
          DropdownMenu(
              dropdownMenuEntries: classList
                  .map<DropdownMenuEntry<CharacterOption>>(
                      (CharacterOption value) {
                return DropdownMenuEntry<CharacterOption>(
                    value: value, label: value.name);
              }).toList(),
              initialSelection: classList.first,
              menuStyle: MenuStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFAD9090))),
              onSelected: (CharacterOption? classPick) {
                setState(() {
                  selectedClass = classPick;
                });
              }),
          const Text(
            'Select Race',
            style: TextStyle(
              color: Color(0xFF302727),
            ),
          ),
          DropdownMenu(
              dropdownMenuEntries: raceList
                  .map<DropdownMenuEntry<CharacterOption>>(
                      (CharacterOption value) {
                return DropdownMenuEntry<CharacterOption>(
                    value: value, label: value.name);
              }).toList(),
              initialSelection: raceList.first,
              menuStyle: MenuStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFAD9090))),
              onSelected: (CharacterOption? racePick) {
                setState(() {
                  selectedRace = racePick;
                });
              }),
          const Text(
            'Select Background',
            style: TextStyle(
              color: Color(0xFF302727),
            ),
          ),
          DropdownMenu(
              dropdownMenuEntries: backgroundList
                  .map<DropdownMenuEntry<CharacterOption>>(
                      (CharacterOption value) {
                return DropdownMenuEntry<CharacterOption>(
                    value: value, label: value.name);
              }).toList(),
              initialSelection: backgroundList.first,
              menuStyle: MenuStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFAD9090))),
              onSelected: (CharacterOption? bgPick) {
                setState(() {
                  selectedBG = bgPick;
                });
              }),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'STR', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    strength = int.parse(text);
                  })),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'DEX', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    dexterity = int.parse(text);
                  })),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'CON', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    constitution = int.parse(text);
                  })),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'INT', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    intelligence = int.parse(text);
                  })),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'WIS', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    wisdom = int.parse(text);
                  })),
          SizedBox(
              width: 100,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'CHA', iconColor: Color(0xFFAD9090)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    charisma = int.parse(text);
                  })),
          MultiSelectDialogField(
            items: cantrips.map((e) => MultiSelectItem(e, e.name)).toList(),
            listType: MultiSelectListType.CHIP,
            title: Text("Cantrips"),
            onConfirm: (values) {
              selectedCantrips = values;
            },
          ),
          MultiSelectDialogField(
            items: firstLevel.map((e) => MultiSelectItem(e, e.name)).toList(),
            listType: MultiSelectListType.CHIP,
            title: Text("First Level Spells"),
            onConfirm: (values) {
              selectedFirstLevel = values;
            },
          ),
          SizedBox(
              width: 350,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  vm.setCharClass(selectedClass!);
                  vm.setRace(selectedRace!);
                  vm.setBackground(selectedBG!);
                  vm.setName(selectedName);
                  vm.setAbilityScores([
                    strength,
                    dexterity,
                    constitution,
                    intelligence,
                    wisdom,
                    charisma
                  ]);
                  if(selectedCantrips != null)
                    {
                      if(selectedFirstLevel != null)
                        {
                          vm.setSpells(selectedCantrips! + selectedFirstLevel!);
                        }
                      else {
                        vm.setSpells(selectedCantrips);
                      }
                    }

                  vm.constructCharacter();
                  Navigator.pushNamed(context, listRoute,
                      arguments: characterListViewModel);
                  Navigator.pushNamed(context, sheetRoute,
                      arguments: vm.character);
                },
                child: const Text('Create Character'),
              ))
        ])));
  }
}
