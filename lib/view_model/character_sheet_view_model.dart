import 'package:character_sheet_dnd/model/character_model.dart';

class CharacterSheetViewModel {
    final CharacterModel character_model;

    CharacterSheetViewModel({required this.character_model});

    // getters for the character info
    String get name => character_model.name;

    (String, List<(String, String)>, List<(String)>) get getCharClass => character_model.charClass;

    (String, List<(String, String)>, List<(String)>) get getSubclass => character_model.subclass;

    (String, List<(String, String)>, List<(String)>) get getRace => character_model.race;

    (String, List<(String, String)>, List<(String)>) get getBackground => character_model.background;

    List<int> get skillProficiencyNums => character_model.skillProficiencyNums;

    List<String> get otherProficiencies => character_model.otherProficiencies;

    List<int> get abilityScores => character_model.abilityScores;

    List<String> get spells => character_model.spells;

    int get maxSpellSlots => character_model.maxSpellSlots;

    int get currSpellSlots => character_model.currSpellSlots;

    int get maxHitPoints => character_model.maxHitPoints;

    int get currHitPoints => character_model.currHitPoints;

    // resource methods for the class
    void addSpell(String spell) {
        spells.add(spell);
    }

    void removeSpell(String spell) {
        spells.remove(spell);
    }

    void addHitPoints(int hitPoints) {
        currHitPoints += hitPoints;
    }

    void updateHitPoints(int hitPoints) {
        currHitPoints = hitPoints;
    }

    void removeHitPoints(int hitPoints) {
        currHitPoints -= hitPoints;
    }

    void addSpellSlots(int spellSlots) {
        currSpellSlots += spellSlots;
    }

    void updateSpellSlots(int spellSlots) {
        currSpellSlots = spellSlots;
    }

    void removeSpellSlots(int spellSlots) {
        currSpellSlots -= spellSlots;
    }

    // return all features to a string for features page
    String featuresToString() {
        String features = "Class Features: \n\n";
        (String, List<(String, String)>, List<(String)>) charClass = character_model.charClass;
        (String, List<(String, String)>, List<(String)>) subclass = character_model.subclass;
        (String, List<(String, String)>, List<(String)>) race = character_model.race;
        (String, List<(String, String)>, List<(String)>) background = character_model.background;
        // iterate over each feature list and add to features
        for (int i = 0; i < charClass[1].length; i++) {
            features += charClass[1][i][0] + ": " + charClass[1][i][1] + "\n\n";
        }
        features += "\nSubclass Features: \n\n";
        for (int i = 0; i < subclass[1].length; i++) {
            features += subclass[1][i][0] + ": " + subclass[1][i][1] + "\n\n";
        }
        features += "\nRace Features: \n\n";
        for (int i = 0; i < race[1].length; i++) {
            features += race[1][i][0] + ": " + race[1][i][1] + "\n\n";
        }
        features += "\nBackground Features: \n\n";
        for (int i = 0; i < background[1].length; i++) {
            features += background[1][i][0] + ": " + background[1][i][1] + "\n\n";
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