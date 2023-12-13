import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';
import 'package:dnd_character_sheet_app/view_model/character_sheet_view_model.dart';

// import 'package:provider/provider.dart';

class CharacterSheetView extends StatefulWidget {
  CharacterModel characterModel;

  CharacterSheetView(this.characterModel);

  @override
  State<CharacterSheetView> createState() => _CharacterSheetViewState(this.characterModel);
}

class _CharacterSheetViewState extends State<CharacterSheetView> {
  late TextEditingController _controller;
  late TextEditingController _attackController;
  late CharacterSheetViewModel vm;
  bool newSpellFlag = false;
  CharacterModel characterModel;

  _CharacterSheetViewState(this.characterModel);

  @override
  void initState() {
    super.initState();
    vm = CharacterSheetViewModel(characterModel: characterModel);
    _controller = TextEditingController.fromValue(
      TextEditingValue(
        text: vm.inventory,
      ),
    );
    _attackController = TextEditingController.fromValue(
      TextEditingValue(
        text: "+ New Attack",
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementHealth() {
    setState(() {
      if (vm.currHitPoints < vm.maxHitPoints) {
        vm.addHitPoints(1);
      }
    });
  }

  void decrementHealth() {
    setState(() {
      if (vm.currHitPoints > 0) {
        vm.removeHitPoints(1);
      }
    });
  }

  void incrementSlots() {
    setState(() {
      if (vm.currSpellSlots! < vm.maxSpellSlots!) {
        vm.addSpellSlots(1);
      }
    });
  }

  void decrementSlots() {
    setState(() {
      if (vm.currSpellSlots! > 0) {
        vm.removeSpellSlots(1);
      }
    });
  }

  void incrementHitDice() {
    setState(() {
      if (vm.currHitDice < vm.maxHitDice) {
        vm.addHitDice(1);
      }
    });
  }

  void decrementHitDice() {
    setState(() {
      if (vm.currHitDice > 0) {
        vm.removeHitDice(1);
      }
    });
  }

  void incrementAC() {
    setState(() {
      vm.addAC(1);
    });
  }

  void decrementAC() {
    setState(() {
      if (vm.armorClass > 0) {
        vm.removeAC(1);
      }
    });
  }

  void addAttack(String value) {
    setState(() {
      vm.updateAttackList(value);
    });
  }

  void flipNewSpellFlag() {
    setState(() {
      newSpellFlag = !newSpellFlag;
    });
  }

  Column getSpellCustomization() {
    if (newSpellFlag) {
      String name = "";
      String castingTime = "";
      String school = "";
      int level = 0;
      String range = "";
      String components = "";
      String duration = "";
      String desc = "";
      return Column(
        children: <Widget>[
          // form for custom spell
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Spell Name',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  name = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Casting Time',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  castingTime = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter School',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  school = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Level',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  level = int.parse(text);
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Range',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  range = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Components',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  components = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Duration',
                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  duration = text;
              })),
          Padding(padding:EdgeInsets.fromLTRB(15, 5, 15, 5), child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Enter Description',

                  iconColor: Color(0xFFAD9090)
              ),
              onChanged: (text) {
                  desc = text;
              })),
          Padding(padding:EdgeInsets.all(10), child: SizedBox(
            width: 200,
            height: 40,
            child: FilledButton(
              onPressed: () {
                setState(() {
                  vm.addCustomSpell(name, desc, level, school, castingTime, range, components, duration);
                  flipNewSpellFlag();
                });
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              child: const Text(
                'Add Spell',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),)
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding:EdgeInsets.all(10), child: SizedBox(
            width: 200,
            height: 40,
            child: FilledButton(
              onPressed: flipNewSpellFlag,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              child: const Text(
                '+ Add New Spell',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),)
        ]
      );
    }
  }

  Column getAttacks() {
    if (vm.attackList != null) {
      return Column(
        children: <Widget>[
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: vm.attackList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
                    child: Text(
                      vm.attackList[index],
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                );
              }
          )

        ],
      );
    } else {
      return Column(
          children: <Widget>[Container(
              width: MediaQuery.of(context).size.width*0.875,
              padding:EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFAD9090),
              ),
              child: Text("No Attacks Found")
          )
          ]
      );
    }
  }

  Column getSpellPage() {
      if (vm.spells != null) {
        return Column(
          children: <Widget>[
            // spell slot tracking
            Container(
                width: MediaQuery.of(context).size.width*0.875,
                decoration: BoxDecoration(
                    color: Color(0xFFAD9090),
                ),
                child: Column (
                    children: <Widget>[
                      Text("Spell Slots: ${vm.currSpellSlots}/${vm.maxSpellSlots}"),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                          SizedBox(
                              width: 30,
                              height: 30,
                              child: FilledButton(
                                onPressed: decrementSlots,
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                ),
                                child: const Text(
                                  '-',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FilledButton(
                                onPressed: incrementSlots,
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                ),
                                child: const Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                        ]),
                    ]
                )
            ),
            // spell list
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: vm.spells?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0),
                      child: ExpansionTile(
                        title: Text(vm.spells![index].name, style: TextStyle(fontSize: 25.0, color: Color(0xFF302727)),),
                        subtitle: Text("Casting Time: ${vm.spells![index].castingTime}", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                        iconColor: Color(0xFF302727),
                        collapsedIconColor: Color(0xFF302727),
                        childrenPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.centerLeft,
                        backgroundColor: Color(0xFFAD9090),
                        collapsedBackgroundColor: Color(0xFFAD9090),
                        children: <Widget>[
                          Text("School: ${vm.spells![index].school}\n", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                          Text("Level: ${vm.spells![index].level}\n", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                          Text("Range: ${vm.spells![index].range}\n", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                          Text("Components: ${vm.spells![index].components}\n", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                          Text("Duration: ${vm.spells![index].duration}\n", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                          Text("Description: ${vm.spells![index].desc}", style: TextStyle(fontSize: 18.0, color: Color(0xFF302727)),),
                        ],
                      )
                  );
                }
          ),
            Container(
                width: MediaQuery.of(context).size.width*0.875,
                decoration: BoxDecoration(
                  color: Color(0xFFAD9090),
                ),
                child: Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                          child: getSpellCustomization()
                      ),
                    ]
                )
            ),
          ]
        );
      } else {
        return Column(
            children: <Widget>[Container(
                width: MediaQuery.of(context).size.width*0.875,
                padding:EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFFAD9090),
                ),
                child: Text("No Spells Found")
              )
            ]
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> consistentStats = [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  width: 80.0,
                  height: 80.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color:const Color(0xFF302727)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFAD9090),
                  ),
                  child: Text('${vm.armorClass} \n Armor Class',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: FilledButton(
                          onPressed: decrementAC,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FilledButton(
                        onPressed: incrementAC,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
            width: 80.0,
            height: 80.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFAD9090),
                border: Border.all(color:const Color(0xFF302727)),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('${vm.abilityModifiers[1]} \nInitiative',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
            width: 80.0,
            height: 80.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFAD9090),
                border: Border.all(color:const Color(0xFF302727)),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('${vm.speed} \nSpeed',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
            width: 80.0,
            height: 80.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFAD9090),
                border: Border.all(color:const Color(0xFF302727)),
                borderRadius: BorderRadius.circular(10)
            ),
            child: const Text('+2 \n Proficiency',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                width: 80.0,
                height: 80.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFFAD9090),
                    border: Border.all(color:const Color(0xFF302727)),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('${vm.currHitPoints}/${vm.maxHitPoints} \n Hit Points',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(children: <Widget>[
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: FilledButton(
                        onPressed: decrementHealth,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FilledButton(
                      onPressed: incrementHealth,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ]),
              ),
            ]
          ),

          Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  width: 80.0,
                  height: 80.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFFAD9090),
                      border: Border.all(color:const Color(0xFF302727)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('${vm.currHitDice}d${vm.hitDice} \nHit Dice',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: FilledButton(
                          onPressed: decrementHitDice,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FilledButton(
                        onPressed: incrementHitDice,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]
          ),


        ],
      ),
      Container(
        margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
        width: MediaQuery.of(context).size.width*0.9,
        height: 20.0,
        color: Color(0xFFAD9090),
        child: Text('Ability Scores', style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
      ),

      Container(
        margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        width: MediaQuery.of(context).size.width*0.9,
        height: 112.0,
        color: Color(0xFFAD9090),
        child: Row(
          children: [
            Column(
              children: [Container(
                margin: EdgeInsets.fromLTRB(17.0, 10.0, 10.0, 0),
                width: 90.0,
                height: 70.0,
                decoration: BoxDecoration(
                    border: Border.all(color:const Color(0xFF302727), width: 3),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('STR \n ${vm.abilityScores[0]} (${vm.abilityModifiers[0]}) \n Save: ${vm.getSavingThrows()[0]}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )],
            ),
            Column(children: [Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              width: 90.0,
              height: 70.0,
              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xFF302727), width: 3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text('DEX \n ${vm.abilityScores[1]} (${vm.abilityModifiers[1]}) \n Save: ${vm.getSavingThrows()[1]}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            )],
            ),
            Column(children: [Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              width: 90.0,
              height: 70.0,
              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xFF302727), width: 3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text('CON \n ${vm.abilityScores[2]} (${vm.abilityModifiers[2]}) \n Save: ${vm.getSavingThrows()[2]}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            )],
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        width: 400.0,
        height: 100.0,
        color: Color(0xFFAD9090),
        child: Row(
          children: [
            Column(
              children: [Container(
                margin: EdgeInsets.fromLTRB(17.0, 0, 10.0, 0),
                width: 90.0,
                height: 70.0,
                decoration: BoxDecoration(
                    border: Border.all(color:const Color(0xFF302727), width: 3),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('INT \n ${vm.abilityScores[3]} (${vm.abilityModifiers[3]}) \n Save: ${vm.getSavingThrows()[3]}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              )],
            ),
            Column(children: [Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              width: 90.0,
              height: 70.0,
              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xFF302727), width: 3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text('WIS \n ${vm.abilityScores[4]} (${vm.abilityModifiers[4]}) \n Save: ${vm.getSavingThrows()[4]}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            )],
            ),
            Column(children: [Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              width: 90.0,
              height: 70.0,

              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xFF302727), width: 3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text('CHA \n ${vm.abilityScores[5]} (${vm.abilityModifiers[5]}) \n Save: ${vm.getSavingThrows()[5]}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            )],
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAD9090),
        title: Text(vm.name,
            style: TextStyle(fontSize: 24, color: const Color(0xFF302727))),
      ),
      body: PageView(
        children: <Widget>[
          // page 1, Features
          SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var widget in consistentStats) widget,
                  Container(
                    margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 20.0,
                    color: Color(0xFFAD9090),
                    child: Text('Features & Traits', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      width: MediaQuery.of(context).size.width*0.9,
                      color: Color(0xFFAD9090),
                      child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(vm.featuresToString(), style: TextStyle(fontSize: 18), textAlign: TextAlign.left)
                      ),
                    ),
                  ),
                ],
              )
          ),
          // page 2, Proficiencies
          SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var widget in consistentStats) widget,
                  Container(
                    margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 20.0,
                    color: Color(0xFFAD9090),
                    child: Text('Skills & Proficiencies', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      width: MediaQuery.of(context).size.width*0.9,
                      color: Color(0xFFAD9090),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(vm.proficienciesToString(), style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
                      ),
                    ),
                  ),
                ],
              )
          ),
          // page 3, Spells
          SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (var widget in consistentStats) widget,
                    Container(
                      margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 20.0,
                      color: Color(0xFFAD9090),
                      child: Text('Spells', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                      child: getSpellPage()
                    ),
                  ],
                )
            ),
          // page 4, Attacks
          SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var widget in consistentStats) widget,
                  Container(
                    margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 20.0,
                    color: Color(0xFFAD9090),
                    child: Text('Attacks', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                        width: MediaQuery.of(context).size.width*0.9,
                        color: Color(0xFFAD9090),
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                getAttacks(),
                                TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3.0, color: Color(0xFF302727)),
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  controller: _attackController,
                                  onSubmitted: (String value) async {
                                    addAttack(value);
                                    _attackController.text = "+ New Attack";
                                  },
                                )
                              ],
                            )
                        ),
                      )
                  ),
                ],
              )
          ),
          // page 5, Inventory
          SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var widget in consistentStats) widget,
                  Container(
                    margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 20.0,
                    color: Color(0xFFAD9090),
                    child: Text('Inventory', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                        width: MediaQuery.of(context).size.width*0.9,
                        color: Color(0xFFAD9090),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: _controller,
                            onChanged: (String value) async {
                              vm.updateInventory(value);
                            },
                          )
                        ),
                      )
                  ),
                ],
              )
          ),
        ],
      )
    );
  }
}
