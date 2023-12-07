import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';

import 'package:flutter/material.dart';

class CharacterSheetViewModel extends ChangeNotifier {
    late CharacterModel characterModel;

    CharacterSheetViewModel({required this.characterModel});

    // getters for the character info
    String get name => characterModel.name;

    CharacterOption get getCharClass => characterModel.charClass;

    CharacterOption? get getSubclass => characterModel.subclass;

    CharacterOption get getRace => characterModel.race;

    CharacterOption get getBackground => characterModel.background;

    List<int> get skillProficiencyNums => characterModel.skillProficiencyNums;

    List<String> get otherProficiencies => characterModel.otherProficiencies;

    List<int> get abilityScores => characterModel.abilityScores;

    List<int> get abilityModifiers => characterModel.abilityModifiers;

    List<Spell>? get spells => characterModel.spells;

    int? get maxSpellSlots => characterModel.maxSpellSlots;

    int? get currSpellSlots => characterModel.currSpellSlots;

    int get maxHitPoints => characterModel.maxHitPoints;

    int get currHitPoints => characterModel.currHitPoints;

    int get armorClass => characterModel.armorClass;

    int get speed => characterModel.speed;

    int get hitDice => characterModel.hitDice;

    List<int> getSavingThrows() {
      return characterModel.getSavingThrows();
    }

    // resource methods for the class
    void addCustomSpell(String name, String desc, int level, String school, String castingTime, String range, String components, String duration) {
        Spell spell = Spell(name: name, desc: desc, level: level, school: school, castingTime: castingTime, range: range, components: components, duration: duration);
        addSpell(spell);
    }

    void addSpell(Spell spell) {
        spells?.add(spell);
    }

    void removeSpell(String spell) {
        spells?.remove(spell);
    }

    void addHitPoints(int hitPoints) {
        updateHitPoints(characterModel.getCurrHitPoints+hitPoints);
    }

    void updateHitPoints(int hitPoints) {
        characterModel.currHitPoints = hitPoints;
    }

    void removeHitPoints(int hitPoints) {
        updateHitPoints(characterModel.getCurrHitPoints-hitPoints);
    }

    void addSpellSlots(int spellSlots) {
        updateSpellSlots(characterModel.getCurrSpellSlots!+spellSlots);
    }

    void updateSpellSlots(int spellSlots) {
        characterModel.currSpellSlots = spellSlots;
    }

    void removeSpellSlots(int spellSlots) {
        updateSpellSlots(characterModel.getCurrSpellSlots!-spellSlots);
    }

    // return all features to a string for features page
    String featuresToString() {
        String features = "Class Features: \n\n";
        CharacterOption charClass = characterModel.charClass;
        CharacterOption? subclass = characterModel.subclass;
        CharacterOption race = characterModel.race;
        CharacterOption background = characterModel.background;
        // iterate over each feature list and add to features
        for (int i = 0; i < charClass.features.length; i++) {
            features += "${charClass.features[i].name}: ${charClass.features[i].desc}\n\n";
        }
        if(subclass != null) {
          features += "\nSubclass Features: \n\n";
          for (int i = 0; i < subclass!.features.length; i++) {
            features +=
            "${subclass.features[i].name}: ${subclass.features[i].desc}\n\n";
          }
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
        for (int i = 0; i < characterModel.otherProficiencies.length; i++) {
            proficiencies += characterModel.otherProficiencies[i] + "\n\n";
        }
        return proficiencies;
    }
}