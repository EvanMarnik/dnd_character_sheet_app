import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/view_model/character_sheet_view_model.dart';

// import 'package:provider/provider.dart';

class CharacterSheetView extends StatefulWidget {
  // const CharacterSheetView({super.key});
  final int charID;

  CharacterSheetView(this.charID);

  @override
  State<CharacterSheetView> createState() => _CharacterSheetViewState();
}

class _CharacterSheetViewState extends State<CharacterSheetView> {
  final TextEditingController _controller = TextEditingController();
  late CharacterSheetViewModel vm;
  // int hp = 15;
  // int maxHP = 15;

  @override
  void initState() {
    super.initState();
    // TODO hard coded sheet for now
    vm = CharacterSheetViewModel(charID: 0);
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

  @override
  Widget build(BuildContext context) {
    // TODO build the character sheet

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAD9090),
        title: Text(vm.name,
            style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: Text('${vm.armorClass} \n Armor Class',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: Text('+${vm.abilityModifiers[1]} \nInitiative',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: Text('${vm.speed} \nSpeed',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: const Text('+2 \n Proficiency',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 25, 0, 25),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: Text('${vm.currHitPoints}/${vm.maxHitPoints} \n Hit Points',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.all(0.0),
                child: Column(children: <Widget>[
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
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
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
                          style: TextStyle(fontSize: 30),
                        ),
                      ))
                ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 25, 25, 25),
                width: 80.0,
                height: 80.0,
                color: Color(0xFFAD9090),
                alignment: Alignment.center,
                child: Text('1d${vm.hitDice} \nHit Dice',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
            width: 400.0,
            height: 20.0,
            color: Color(0xFFAD9090),
            child: Text('Ability Scores', style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            width: 400.0,
            height: 112.0,
            color: Color(0xFFAD9090),
            child: Row(
              children: [
                Column(
                  children: [Container(
                    margin: EdgeInsets.fromLTRB(17.0, 10.0, 10.0, 0),
                    width: 90.0,
                    height: 70.0,
                    decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                    child: Text('STR \n ${vm.abilityScores[0]} (${vm.abilityModifiers[0]}) \n Save: ${vm.getSavingThrows()[0]}',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  )],
                ),
                Column(children: [Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  width: 90.0,
                  height: 70.0,
                  decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                  child: Text('DEX \n ${vm.abilityScores[1]} (${vm.abilityModifiers[1]}) \n Save: ${vm.getSavingThrows()[1]}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                )],
                ),
                Column(children: [Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  width: 90.0,
                  height: 70.0,
                  decoration: BoxDecoration(border: Border.all(color:Colors.black)),
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
                    decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                    child: Text('INT \n ${vm.abilityScores[3]} (${vm.abilityModifiers[3]}) \n Save: ${vm.getSavingThrows()[3]}',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  )],
                ),
                Column(children: [Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  width: 90.0,
                  height: 70.0,
                  decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                  child: Text('WIS \n ${vm.abilityScores[4]} (${vm.abilityModifiers[4]}) \n Save: ${vm.getSavingThrows()[4]}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                )],
                ),
                Column(children: [Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  width: 90.0,
                  height: 70.0,

                  decoration: BoxDecoration(border: Border.all(color:Colors.black)),
                  child: Text('CHA \n ${vm.abilityScores[5]} (${vm.abilityModifiers[5]}) \n Save: ${vm.getSavingThrows()[5]}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                )],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
