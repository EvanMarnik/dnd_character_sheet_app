import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';

import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';

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

    int get currHitDice => characterModel.currHitDice;

    int get maxHitDice => characterModel.maxHitDice;

    String get inventory => characterModel.inventory;

    List<String> get attackList => characterModel.attackList;

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

    void addHitDice(int hitDice) {
        updateHitDice(characterModel.getCurrHitDice+hitDice);
    }

    void updateHitDice(int hitDice) {
        characterModel.currHitDice = hitDice;
    }

    void removeHitDice(int hitDice) {
        updateHitDice(characterModel.getCurrHitDice-hitDice);
    }

    void addAC(int ac) {
        updateAC(characterModel.getArmorClass+ac);
    }

    void updateAC(int ac) {
        characterModel.armorClass = ac;
    }

    void removeAC(int ac) {
        updateAC(characterModel.getArmorClass-ac);
    }

    void updateInventory(String inventory) {
        characterModel.inventory = inventory;
    }

    void updateAttackList(String value) {
        characterModel.attackList.add(value);
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
        String proficiencies = "Skill Proficiencies: \n\n"
        "\t${characterModel.skillProficiencyNums.contains(ACROBATICS) ? characterModel.abilityModifiers[1]+2 : characterModel.abilityModifiers[1]}\t\tAcrobatics\n"
        "\t${characterModel.skillProficiencyNums.contains(ANIMAL_HANDLING) ? characterModel.abilityModifiers[4]+2 : characterModel.abilityModifiers[4]}\t\tAnimal Handling\n"
        "\t${characterModel.skillProficiencyNums.contains(ARCANA) ? characterModel.abilityModifiers[3]+2 : characterModel.abilityModifiers[3]}\t\tArcana\n"
        "\t${characterModel.skillProficiencyNums.contains(ATHLETICS) ? characterModel.abilityModifiers[0]+2 : characterModel.abilityModifiers[0]}\t\tAthletics\n"
        "\t${characterModel.skillProficiencyNums.contains(DECEPTION) ? characterModel.abilityModifiers[5]+2 : characterModel.abilityModifiers[5]}\t\tDeception\n"
        "\t${characterModel.skillProficiencyNums.contains(HISTORY) ? characterModel.abilityModifiers[3]+2 : characterModel.abilityModifiers[3]}\t\tHistory\n"
        "\t${characterModel.skillProficiencyNums.contains(INSIGHT) ? characterModel.abilityModifiers[4]+2 : characterModel.abilityModifiers[4]}\t\tInsight\n"
        "\t${characterModel.skillProficiencyNums.contains(INTIMIDATION) ? characterModel.abilityModifiers[5]+2 : characterModel.abilityModifiers[5]}\t\tIntimidation\n"
        "\t${characterModel.skillProficiencyNums.contains(INVESTIGATION) ? characterModel.abilityModifiers[3]+2 : characterModel.abilityModifiers[3]}\t\tInvestigation\n"
        "\t${characterModel.skillProficiencyNums.contains(MEDICINE) ? characterModel.abilityModifiers[4]+2 : characterModel.abilityModifiers[4]}\t\tMedicine\n"
        "\t${characterModel.skillProficiencyNums.contains(NATURE) ? characterModel.abilityModifiers[3]+2 : characterModel.abilityModifiers[3]}\t\tNature\n"
        "\t${characterModel.skillProficiencyNums.contains(PERCEPTION) ? characterModel.abilityModifiers[4]+2 : characterModel.abilityModifiers[4]}\t\tPerception\n"
        "\t${characterModel.skillProficiencyNums.contains(PERFORMANCE) ? characterModel.abilityModifiers[5]+2 : characterModel.abilityModifiers[5]}\t\tPerformance\n"
        "\t${characterModel.skillProficiencyNums.contains(PERSUASION) ? characterModel.abilityModifiers[5]+2 : characterModel.abilityModifiers[5]}\t\tPersuasion\n"
        "\t${characterModel.skillProficiencyNums.contains(RELIGION) ? characterModel.abilityModifiers[3]+2 : characterModel.abilityModifiers[3]}\t\tReligion\n"
        "\t${characterModel.skillProficiencyNums.contains(SLEIGHT_OF_HAND) ? characterModel.abilityModifiers[1]+2 : characterModel.abilityModifiers[1]}\t\tSleight of Hand\n"
        "\t${characterModel.skillProficiencyNums.contains(STEALTH) ? characterModel.abilityModifiers[1]+2 : characterModel.abilityModifiers[1]}\t\tStealth\n"
        "\t${characterModel.skillProficiencyNums.contains(SURVIVAL) ? characterModel.abilityModifiers[4]+2 : characterModel.abilityModifiers[4]}\t\tSurvival\n\n"
        "Other Proficiencies: \n\n";
        for (int i = 0; i < characterModel.otherProficiencies.length; i++) {
            proficiencies += "${characterModel.otherProficiencies[i]}\n";
        }
        return proficiencies;
    }
}