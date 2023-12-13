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
import '../model/feature.dart';
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

  int numClassSkillProficiencies = 0;
  int numClassOtherProficiencies = 0;
  int numClassFeatures = 0;

  int numRaceSkillProficiencies = 0;
  int numRaceOtherProficiencies = 0;
  int numRaceFeatures = 0;

  int numBGSkillProficiencies = 0;
  int numBGOtherProficiencies = 0;
  int numBGFeatures = 0;

  Column skillProficiencyForm(int numProficiencies, String type) {
    List<Widget> skillProficiencyList = [];
    for (int i = 0; i < numProficiencies; i++) {
      skillProficiencyList.add(TextField(
          decoration: InputDecoration(
              hintText: 'Enter Skill Proficiency ${i+1} (# from 1-18)',
              iconColor: Color(0xFFAD9090),
              contentPadding: EdgeInsets.symmetric(horizontal: 10)
          ),
          onSubmitted: (text) {
            // vm.addSkillProficiency(int.parse(text)-1);
            switch (type) {
              case "Class":
                // selectedClass!.skillProficiencies[i] = int.parse(text)-1;
                selectedClass!.skillProficiencies.add(int.parse(text)-1);
                // vm.addSkillProficiency(int.parse(text)-1);
                break;
              case "Race":
                // selectedRace!.skillProficiencies[i] = int.parse(text)-1;
                selectedRace!.skillProficiencies.add(int.parse(text)-1);
                // vm.addSkillProficiency(int.parse(text)-1);
                break;
              default:
                // selectedBG!.skillProficiencies[i] = int.parse(text)-1;
                selectedBG!.skillProficiencies.add(int.parse(text)-1);
            }
          }));
    }
    return Column(children: skillProficiencyList);
  }

  Column otherProficiencyForm(int numProficiencies, String type) {
    List<Widget> otherProficiencyList = [];
    for (int i = 0; i < numProficiencies; i++) {
      otherProficiencyList.add(TextField(
          decoration: InputDecoration(
              hintText: 'Enter Other Proficiency ${i+1}',
              iconColor: Color(0xFFAD9090),
              contentPadding: EdgeInsets.symmetric(horizontal: 10)
          ),
          onSubmitted: (text) {
            // vm.addOtherProficiency(text);
            switch (type) {
              case "Class":
                // selectedClass!.otherProficiencies[i] = text;
                selectedClass!.otherProficiencies.add(text);
                break;
              case "Race":
                // selectedRace!.otherProficiencies[i] = text;
                selectedRace!.otherProficiencies.add(text);
                break;
              default:
                // selectedBG!.otherProficiencies[i] = text;
                selectedBG!.otherProficiencies.add(text);
            }
          }));
    }
    return Column(children: otherProficiencyList);
  }

  Column featureForm(int numFeatures, String type) {
    List<Widget> featureList = [];
    for (int i = 0; i < numFeatures; i++) {
      Feature newFeature = Feature(name: "", desc: "");
      featureList.add(TextField(
          decoration: InputDecoration(
              hintText: 'Enter Feature ${i+1} Name',
              iconColor: Color(0xFFAD9090),
              contentPadding: EdgeInsets.symmetric(horizontal: 10)
          ),
          onSubmitted: (text) {
            newFeature.name = text;
          }));
      featureList.add(TextField(
          decoration: InputDecoration(
              hintText: 'Enter Feature ${i+1} Description',
              iconColor: Color(0xFFAD9090),
              contentPadding: EdgeInsets.symmetric(horizontal: 20)
          ),
          onSubmitted: (text) {
            newFeature.desc = text;
            switch (type) {
              case "Class":
              // selectedClass!.features[i] = newFeature;
                selectedClass!.features.add(newFeature);
                break;
              case "Race":
              // selectedRace!.features[i] = newFeature;
                selectedRace!.features.add(newFeature);
                break;
              default:
              // selectedBG!.features[i] = newFeature;
                selectedBG!.features.add(newFeature);
            }
          }));

    }
    return Column(children: featureList);
  }

  Column getClassCustomization() {
    if (selectedClass == customClass || !classList.contains(selectedClass)) {
      return Column(
        children: <Widget>[
          // form for custom class
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Class Name',
                  iconColor: Color(0xFFAD9090)
              ),
              onSubmitted: (text) {
                setState(() {
                  selectedClass!.name = text;
                });
              }),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Hit Dice',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  vm.setHitDice(int.parse(text));
                });
              }),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Max Spell Slots',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  if (int.parse(text) > 0) {  // only set if above 0
                    vm.setMaxSpellSlots(int.parse(text));
                  }
                });
              }),
          // form for custom class proficiencies, ask for number of proficiencies then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Skill Proficiencies',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numClassSkillProficiencies = int.parse(text);
                });
              }),
              skillProficiencyForm(numClassSkillProficiencies, "Class"),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Other Proficiencies',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numClassOtherProficiencies = int.parse(text);
                });
              }),
              otherProficiencyForm(numClassOtherProficiencies, "Class"),
          // form for custom class features, ask for number of features then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Features',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numClassFeatures = int.parse(text);
                });
              }),
              featureForm(numClassFeatures, "Class"),
        ],
      );
    } else {
      return Column();
    }
  }

  Column getRaceCustomization() {
    if (selectedRace == customRace || !raceList.contains(selectedRace)) {
      return Column(
        children: <Widget>[
          // form for custom class
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Race Name',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                setState(() {
                  selectedRace!.name = text;
                });
              }),
          // form for custom race proficiencies, ask for number of proficiencies then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Skill Proficiencies',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numRaceSkillProficiencies = int.parse(text);
                });
              }),
          skillProficiencyForm(numRaceSkillProficiencies, "Race"),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Other Proficiencies',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numRaceOtherProficiencies = int.parse(text);
                });
              }),
          otherProficiencyForm(numRaceOtherProficiencies, "Race"),
          // form for custom class features, ask for number of features then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Features',
                  iconColor: Color(0xFFAD9090)
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numRaceFeatures = int.parse(text);
                });
              }),
          featureForm(numRaceFeatures, "Race"),
        ],
      );
    } else {
      return Column();
    }
  }

  Column getBGCustomization() {
    if (selectedBG == customBG || !backgroundList.contains(selectedBG)) {
      return Column(
        children: <Widget>[
          // form for custom class
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Background Name',
                  iconColor: Color(0xFFAD9090)
              ),
              onSubmitted: (text) {
                setState(() {
                  selectedBG!.name = text;
                });
              }),
          // form for custom background proficiencies, ask for number of proficiencies then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Skill Proficiencies',
                  iconColor: Color(0xFFAD9090),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numBGSkillProficiencies = int.parse(text);
                });
              }),
          skillProficiencyForm(numBGSkillProficiencies, "BG"),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Other Proficiencies',
                  iconColor: Color(0xFFAD9090),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numBGOtherProficiencies = int.parse(text);
                });
              }),
          otherProficiencyForm(numBGOtherProficiencies, "BG"),
          // form for custom class features, ask for number of features then ask for each one
          TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Number of Features',
                  iconColor: Color(0xFFAD9090),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (text) {
                setState(() {
                  numBGFeatures = int.parse(text);
                });
              }),
          featureForm(numBGFeatures, "BG"),
        ],
      );
    } else {
      return Column();
    }
  }
  List<Spell>? selectedCantrips;
  List<Spell>? selectedFirstLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFAD9090),
        appBar: AppBar(
          backgroundColor: Color(0xFF302727),
          title: const Text('Character Creator',
              style: TextStyle(color: const Color(0xFFAD9090))),
        ),
        body: SingleChildScrollView(
            child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Name', iconColor: Color(0xFFAD9090)),

                        onChanged: (text) {
                          selectedName = text;
                        })
                  )),

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
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: getClassCustomization(),
                  )),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: getRaceCustomization(),
              )),
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
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: getBGCustomization(),
                  )),
                  const Text(
                    'Select Ability Scores',
                    style: TextStyle(
                      color: Color(0xFF302727),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                        })

                  )),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                          })

                  )),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                          })

                  )),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                          })

                  )),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                          })

                  )),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                          })

                  )),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: MultiSelectDialogField(
                      items: cantrips.map((e) => MultiSelectItem(e, e.name)).toList(),
                      listType: MultiSelectListType.CHIP,
                      title: Text("Cantrips"),
                      onConfirm: (values) {
                        selectedCantrips = values;
                      },
                    ),
                  )),
            Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: MultiSelectDialogField(
                    items: firstLevel.map((e) => MultiSelectItem(e, e.name)).toList(),
                    listType: MultiSelectListType.CHIP,
                    title: Text("First Level Spells"),
                    onConfirm: (values) {
                      selectedFirstLevel = values;
                    },
                  ),
            )),

              Padding(padding: EdgeInsets.symmetric(vertical: 10), child: SizedBox(
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
                      vm.setAbilityScores([strength, dexterity, constitution, intelligence, wisdom, charisma]);
                      if(selectedCantrips != null)
                    {
                      if(selectedFirstLevel != null)
                        {
                          vm.setSpells(selectedCantrips! + selectedFirstLevel!);
                        }
                      else {
                        vm.setSpells(selectedCantrips);
                      }
                    } else if (selectedFirstLevel == null) {  // if both are null
                        vm.setSpells(null); // force null spell list
                      }
                      vm.constructCharacter();
                      Navigator.pushNamed(context, listRoute,
                          arguments: characterListViewModel);
                      Navigator.pushNamed(context, sheetRoute,
                          arguments: vm.character);
                    },
                    child: const Text('Create Character'),
                  )))
            ]))));
  }
}
