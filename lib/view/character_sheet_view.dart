import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/view_model/character_sheet_view_model.dart';

// import 'package:provider/provider.dart';

class CharacterSheetView extends StatefulWidget {
  // const CharacterSheetView({super.key});
  final int charID;

  CharacterSheetView(this.charID);

  @override
  _CharacterSheetViewState createState() => _CharacterSheetViewState();
}

class _CharacterSheetViewState extends State<CharacterSheetView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO hard coded sheet for now
  }

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<CharacterSheetViewModel>(context);

    // TODO hard coded sheet for now
    // final vm = CharacterSheetViewModel(character_model: CharacterModel(
    //     name: "Coddrin Thunderslayer",
    //     charClass: (
    //         "Barbarian",
    //         [
    //             ("Rage", "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action.\n\nWhile raging, you gain the following benefits if you aren't wearing heavy armor:\n\nYou have advantage on Strength checks and Strength saving throws.\nWhen you make a melee weapon attack using Strength, you gain a bonus to the damage roll that increases as you gain levels as a barbarian, as shown in the Rage Damage column of the Barbarian table.\nYou have resistance to bludgeoning, piercing, and slashing damage.\nIf you are able to cast spells, you can't cast them or concentrate on them while raging.\n\nYour rage lasts for 1 minute. It ends early if you are knocked unconscious or if your turn ends and you haven't attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on your turn as a bonus action.\n\nOnce you have raged the number of times shown for your barbarian level in the Rages column of the Barbarian table, you must finish a long rest before you can rage again."),
    //             ("Unarmored Defense", "While you are not wearing any armor, your armor class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit.")
    //         ],
    //         ["Light Armor", "Medium Armor", "Shields", "Simple Weapons", "Martial Weapons"],
    //         [3, 11]
    //     ),
    //     subclass: null,
    //     background: (
    //         "Folk Hero",
    //         [("Rustic Hospitality", "Since you come from the ranks of the common folk, you fit in among them with ease. You can find a place to hide, rest, or recuperate among other commoners, unless you have shown yourself to be a danger to them. They will shield you from the law or anyone else searching for you, though they will not risk their lives for you.")],
    //         ["Artisan's Tools", "Vehicles (Land)"],
    //         [1, 17]
    //     ),
    //     race: (
    //         "Half-Orc",
    //         [
    //             ("Darkvision", "Your ability scores each increase by 1."),
    //             ("Menacing","You gain proficiency in the Intimidation skill."),
    //             ("Relentless Endurance","When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. You can’t use this feature again until you finish a long rest."),
    //             ("Savage Attacks", "When you score a critical hit with a melee weapon attack, you can roll one of the weapon’s damage dice one additional time and add it to the extra damage of the critical hit.")
    //         ],
    //         ["Common", "Orc"],
    //         [7]
    //     ),
    //     abilityScores: [16, 14, 16, 8, 10, 8],
    //     spells: null,
    //     maxSpellSlots: null,
    //     currSpellSlots: null,
    //     maxHitPoints: 15,
    //     currHitPoints: 15
    // ));

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
                child: const Text('14 \n Armor Class'),

              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('+3 \nInitiative'),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('30 \nSpeed'),
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
                child: const Text('+2 \n Proficiency'),

              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('12/12 \n Hit Points'),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                width: 80.0,
                height: 80.0,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('1d10 \nHit Dice'),
              ),
            ],
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
