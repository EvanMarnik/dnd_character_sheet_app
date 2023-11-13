import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';

class CharacterSheetViewModel {
    final CharacterModel character_model;

    CharacterSheetViewModel({required this.character_model});

    // getters for the character info
    String get name => character_model.name;

    CharacterOption get getCharClass => character_model.charClass;

    CharacterOption? get getSubclass => character_model.subclass;

    CharacterOption get getRace => character_model.race;

    CharacterOption get getBackground => character_model.background;

    List<int> get skillProficiencyNums => character_model.skillProficiencyNums;

    List<String> get otherProficiencies => character_model.otherProficiencies;

    List<int> get abilityScores => character_model.abilityScores;

    List<String>? get spells => character_model.spells;

    int? get maxSpellSlots => character_model.maxSpellSlots;

    int? get currSpellSlots => character_model.currSpellSlots;

    int get maxHitPoints => character_model.maxHitPoints;

    int get currHitPoints => character_model.currHitPoints;

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