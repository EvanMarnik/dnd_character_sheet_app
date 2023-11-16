import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';

import 'package:flutter/material.dart';

class CharacterSheetViewModel extends ChangeNotifier {
    final int charID;
    late CharacterModel character_model;

    CharacterSheetViewModel({required this.charID}) {
        character_model = CharacterModel(
                name: "Coddrin Thunderslayer",
                charClass: CharacterOption(
                    name: "Barbarian",
                    features: [
                        Feature(name: "Rage", desc: "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action.\n\nWhile raging, you gain the following benefits if you aren't wearing heavy armor:\n\nYou have advantage on Strength checks and Strength saving throws.\nWhen you make a melee weapon attack using Strength, you gain a bonus to the damage roll that increases as you gain levels as a barbarian, as shown in the Rage Damage column of the Barbarian table.\nYou have resistance to bludgeoning, piercing, and slashing damage.\nIf you are able to cast spells, you can't cast them or concentrate on them while raging.\n\nYour rage lasts for 1 minute. It ends early if you are knocked unconscious or if your turn ends and you haven't attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on your turn as a bonus action.\n\nOnce you have raged the number of times shown for your barbarian level in the Rages column of the Barbarian table, you must finish a long rest before you can rage again."),
                        Feature(name: "Unarmored Defense", desc: "While you are not wearing any armor, your armor class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit.")
                    ],
                    otherProficiencies: ["Light Armor", "Medium Armor", "Shields", "Simple Weapons", "Martial Weapons"],
                    skillProficiencies: [3, 11]
                ),
                subclass: null,
                background: CharacterOption(
                    name: "Folk Hero",
                    features: [
                        Feature(name: "Rustic Hospitality", desc: "Since you come from the ranks of the common folk, you fit in among them with ease. You can find a place to hide, rest, or recuperate among other commoners, unless you have shown yourself to be a danger to them. They will shield you from the law or anyone else searching for you, though they will not risk their lives for you.")
                    ],
                    otherProficiencies: ["Artisan's Tools", "Vehicles (Land)"],
                    skillProficiencies: [1, 17]
                ),
                race: CharacterOption(
                    name: "Half-Orc",
                    features: [
                        Feature(name: "Darkvision", desc: "Your ability scores each increase by 1."),
                        Feature(name: "Menacing",desc: "You gain proficiency in the Intimidation skill."),
                        Feature(name: "Relentless Endurance",desc: "When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. You can’t use this feature again until you finish a long rest."),
                        Feature(name: "Savage Attacks", desc: "When you score a critical hit with a melee weapon attack, you can roll one of the weapon’s damage dice one additional time and add it to the extra damage of the critical hit.")
                    ],
                    otherProficiencies: ["Common", "Orc"],
                    skillProficiencies: [7]
                ),
                abilityScores: [16, 14, 16, 8, 10, 8],
                spells: null,
                maxSpellSlots: null,
                currSpellSlots: null,
                maxHitPoints: 15,
                currHitPoints: 15,
                armorClass: 15,
                speed: 30,
                hitDice: 12,
            );
    }

    // getters for the character info
    String get name => character_model.name;

    CharacterOption get getCharClass => character_model.charClass;

    CharacterOption? get getSubclass => character_model.subclass;

    CharacterOption get getRace => character_model.race;

    CharacterOption get getBackground => character_model.background;

    List<int> get skillProficiencyNums => character_model.skillProficiencyNums;

    List<String> get otherProficiencies => character_model.otherProficiencies;

    List<int> get abilityScores => character_model.abilityScores;

    List<int> get abilityModifiers => character_model.abilityModifiers;

    List<String>? get spells => character_model.spells;

    int? get maxSpellSlots => character_model.maxSpellSlots;

    int? get currSpellSlots => character_model.currSpellSlots;

    int get maxHitPoints => character_model.maxHitPoints;

    int get currHitPoints => character_model.currHitPoints;

    int get armorClass => character_model.armorClass;

    int get speed => character_model.speed;

    int get hitDice => character_model.hitDice;

    List<int> getSavingThrows() {
      return character_model.getSavingThrows();
    }

    // resource methods for the class
    void addSpell(String spell) {
        spells?.add(spell);
    }

    void removeSpell(String spell) {
        spells?.remove(spell);
    }

    void addHitPoints(int hitPoints) {
        updateHitPoints(character_model.getCurrHitPoints+hitPoints);
    }

    void updateHitPoints(int hitPoints) {
        character_model.currHitPoints = hitPoints;
    }

    void removeHitPoints(int hitPoints) {
        updateHitPoints(character_model.getCurrHitPoints-hitPoints);
    }

    void addSpellSlots(int spellSlots) {
        updateSpellSlots(character_model.getCurrSpellSlots!+spellSlots);
    }

    void updateSpellSlots(int spellSlots) {
        character_model.currSpellSlots = spellSlots;
    }

    void removeSpellSlots(int spellSlots) {
        updateSpellSlots(character_model.getCurrSpellSlots!-spellSlots);
    }

    // return all features to a string for features page
    String featuresToString() {
        String features = "Class Features: \n\n";
        CharacterOption charClass = character_model.charClass;
        CharacterOption? subclass = character_model.subclass;
        CharacterOption race = character_model.race;
        CharacterOption background = character_model.background;
        // iterate over each feature list and add to features
        for (int i = 0; i < charClass.features.length; i++) {
            features += "${charClass.features[i].name}: ${charClass.features[i].desc}\n\n";
        }
        features += "\nSubclass Features: \n\n";
        for (int i = 0; i < subclass!.features.length; i++) {
            features += "${subclass.features[i].name}: ${subclass.features[i].desc}\n\n";
        }
        features += "\nRace Features: \n\n";
        for (int i = 0; i < race.features.length; i++) {
            features += "${race.features[i].name}: ${race.features[i].desc}\n\n";
        }
        features += "\nBackground Features: \n\n";
        for (int i = 0; i < background.features.length; i++) {
            features += "${background.features[i].name}: ${background.features[i].desc}\n\n";
        }
        return features;
    }

    // return all other proficiencies to a string for proficiencies page
    String proficienciesToString() {
        String proficiencies = "Other Proficiencies: \n\n";
        for (int i = 0; i < character_model.otherProficiencies.length; i++) {
            proficiencies += character_model.otherProficiencies[i] + "\n\n";
        }
        return proficiencies;
    }
}