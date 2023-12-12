import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

import '../model/character_model.dart';
import '../model/character_option.dart';

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
 CharacterOption? selectedClass = barbarian;
  String selectedRace = 'dragonborn';
  String selectedBG = 'acolyte';
  List<CharacterOption> classList = classes;
  List<String> raceList = ['Dragonborn','Dwarf','Elf','Gnome','Half Elf','Halfling','Half Orc','Human','Tiefling'];
  List<String> backgroundList = ['Acolyte','Charlatan', 'Criminal', 'Entertainer', 'Folk Hero', 'Guild Artisan', 'Hermit', 'Noble',
    'Outlander', 'Sage', 'Sailor', 'Soldier', 'Urchin'];


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
                    classList.map<DropdownMenuEntry<CharacterOption>>((CharacterOption value) {
                  return DropdownMenuEntry<CharacterOption>(value: value, label: value.name);
                }).toList(),
                initialSelection: classList.first,

                menuStyle: MenuStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFAD9090))
                ),
                  onSelected: (CharacterOption? classPick) {
                    setState(() {
                      selectedClass= classPick;
                    });
                  }
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
                  ),
                  const Text(
                    'Select Background',
                    style: TextStyle(
                      color: Color(0xFFAD9090),
                    ),
                  ),
                  DropdownMenu(

                    dropdownMenuEntries:
                    backgroundList.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                    initialSelection: backgroundList.first,

                    menuStyle: MenuStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFAD9090))
                    ),
                  ),

                  SizedBox(
                      width: 350,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 25),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, sheetRoute, arguments: CharacterModel(
                            name: "Coddrin Thunderslayer",
                            charClass: selectedClass!,
                            subclass: null,
                            background: folkHero,
                            race: halfOrc,
                            abilityScores: [16, 14, 16, 8, 10, 8],
                            spells: null,
                            maxSpellSlots: null,
                            currSpellSlots: null,
                            maxHitPoints: 15,
                            currHitPoints: 15,
                            armorClass: 15,
                            speed: 30,
                            hitDice: 12,
                          ));
                        },
                        child: const Text('Create Character'),
                      )
                  )

            ])));
  }
}
