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
  int hp = 15;
  int maxHP = 15;

  @override
  void initState() {
    super.initState();
    // TODO hard coded sheet for now
  }



  void incrementHealth() {
    setState(() {
      if (hp < maxHP) {
        hp += 1;
      }
    });
  }

  void decrementHealth() {
    setState(() {
      if (hp > 0) {
        hp -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    // TODO build the character sheet
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0099a9),
        title: const Text('Coddrin Thunderslayer'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('14 \n Armor Class', style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('+3 \nInitiative', style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('30 \nSpeed', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('+2 \n Proficiency', style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 25, 0, 25),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: Text('${hp}/15 \n Hit Points', style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: EdgeInsets.all(0.0),
                child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: FilledButton(
                          onPressed: incrementHealth,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          child: const Text('+', style: TextStyle(fontSize: 30),),
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
                            child: const Text('-', style: TextStyle(fontSize: 30),),
                          )
                      )
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 25, 25, 25),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('1d10 \nHit Dice', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(25.0),
            width: 400.0,
            height: 300.0,
            color: Colors.amberAccent,
            alignment: Alignment.center,
              child: const Text('Ability Scores', style: TextStyle(fontSize: 18))
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
