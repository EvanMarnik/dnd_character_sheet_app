import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';

import 'package:dnd_character_sheet_app/model/character_model.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

class CharacterCreatorViewModel extends ChangeNotifier{
    CharacterListViewModel characterListViewModel;
    late CharacterOption charClass = barbarian;
    late CharacterOption? subclass = null;
    late CharacterOption background = acolyte;
    late CharacterOption race = dragonborn;
    late List<int> abilityScores = [0, 0, 0, 0, 0, 0];
    late List<Spell>? spells = [];
    late String name = "";

    late int? maxSpellSlots = null;
    late int? currSpellSlots = null;
    late int maxHitPoints = 0;
    late int currHitPoints = 0;
    late int hitDice = 0;

    late List<int> skillProficiencyNums = [];
    late List<String> otherProficiencies = [];
    late List<int> abilityModifiers = [];

    late CharacterModel character = CharacterModel(
        name: "Null",
        charClass: barbarian,
        subclass: null,
        background: acolyte,
        race: dragonborn,
        abilityScores: [0, 0, 0, 0, 0, 0],
        spells: null,
        maxSpellSlots: null,
        currSpellSlots: null,
        maxHitPoints: 0,
        currHitPoints: 0,
        armorClass: 0,
        speed: 30,
        hitDice: 0,
    );

    CharacterCreatorViewModel({required this.characterListViewModel});

    // getters and setters for the character info
    void setCharClass(CharacterOption charClass) {
        this.charClass = charClass;
        notifyListeners();
    }
    CharacterOption get getCharClass => charClass;

    void setSubclass(CharacterOption? subclass) {
        this.subclass = subclass;
        notifyListeners();
    }
    CharacterOption? get getSubclass => subclass;

    void setBackground(CharacterOption background) {
        this.background = background;
        notifyListeners();
    }
    CharacterOption get getBackground => background;

    void setRace(CharacterOption race) {
        this.race = race;
        notifyListeners();
    }
    CharacterOption get getRace => race;

    void setAbilityScores(List<int> abilityScores) {
        this.abilityScores = abilityScores;
        notifyListeners();
    }
    List<int> get getAbilityScores => abilityScores;

    void setSpells(List<Spell>? spells) {
        this.spells = spells;
        notifyListeners();
    }
    List<Spell>? get getSpells => spells;

    void setName(String name) {
        this.name = name;
        notifyListeners();
    }
    String get getName => name;

    void setMaxSpellSlots(int? maxSpellSlots) {
        this.maxSpellSlots = maxSpellSlots;
        notifyListeners();
    }
    int? get getMaxSpellSlots => maxSpellSlots;

    void setCurrSpellSlots(int? currSpellSlots) {
        this.currSpellSlots = currSpellSlots;
        notifyListeners();
    }
    int? get getCurrSpellSlots => currSpellSlots;

    void setMaxHitPoints(int maxHitPoints) {
        this.maxHitPoints = maxHitPoints;
        notifyListeners();
    }
    int get getMaxHitPoints => maxHitPoints;

    void setCurrHitPoints(int currHitPoints) {
        this.currHitPoints = currHitPoints;
        notifyListeners();
    }
    int get getCurrHitPoints => currHitPoints;

    void setHitDice(int hitDice) {
        this.hitDice = hitDice;
        notifyListeners();
    }
    int get getHitDice => hitDice;

    void addSkillProficiency(int prof) {
        this.skillProficiencyNums.add(prof);
    }

    void addOtherProficiency(String prof) {
        this.otherProficiencies.add(prof);
    }

    void addClassFeature(Feature feature) {
        this.charClass.features.add(feature);
    }

    void addSubclassFeature(Feature feature) {
        this.subclass?.features.add(feature);
    }

    void addBackgroundFeature(Feature feature) {
        this.background.features.add(feature);
    }

    void addRaceFeature(Feature feature) {
        this.race.features.add(feature);
    }

    void constructCharacter() {
        int determinedHitDice = hitDice ?? 0;
        // combine proficiency lists only if not custom
        // if (!(charClass == customClass || !classes.contains(charClass))) {
            skillProficiencyNums = charClass.getSkillProficiencies;
            otherProficiencies = charClass.getOtherProficiencies;
        // }
        // if (!(race == customRace || !races.contains(customRace))) {
            skillProficiencyNums.addAll(race.getSkillProficiencies);
            otherProficiencies.addAll(race.getOtherProficiencies);
        // }
        // if (!(background == customBG || !backgrounds.contains(customBG))) {
            skillProficiencyNums.addAll(background.getSkillProficiencies);
            otherProficiencies.addAll(background.getOtherProficiencies);
        // }

        // conditionally add subclass proficiencies
        if (subclass != null) {
            skillProficiencyNums.addAll(subclass?.getSkillProficiencies as Iterable<int>);
            otherProficiencies.addAll(subclass?.getOtherProficiencies as Iterable<String>);
        }

        // construct ability modifiers
        for (int score in abilityScores) {
            abilityModifiers.add(((score-10)/2).floor());
        }

        // set spell slots
        if (charClass.name == "Bard" || charClass.name == "Cleric" || charClass.name == "Druid" || charClass.name == "Sorcerer" || charClass.name == "Warlock" || charClass.name == "Wizard") {
            maxSpellSlots = 2;
            currSpellSlots = 2;
        }
        else {
            maxSpellSlots = null;
            currSpellSlots = null;
        }

        // set hit points
        maxHitPoints = 0;
        currHitPoints = 0;
        if (charClass.name == "Barbarian") {
            determinedHitDice = 12;
        }
        else if (charClass.name == "Bard" || charClass.name == "Cleric" || charClass.name == "Druid" || charClass.name == "Monk" || charClass.name == "Rogue" || charClass.name == "Warlock") {
            determinedHitDice = 8;
        }
        else if (charClass.name == "Fighter" || charClass.name == "Paladin" || charClass.name == "Ranger") {
            determinedHitDice = 10;
        }
        else if (charClass.name == "Sorcerer" || charClass.name == "Wizard") {
            determinedHitDice = 6;
        }

        maxHitPoints += determinedHitDice+abilityModifiers[2];
        currHitPoints += maxHitPoints;

        // set subclass
        if (charClass.name == "Cleric") {
            subclass = lifeDomain;
        } else if (charClass.name == "Sorcerer") {
            subclass = draconicBloodline;
        } else if (charClass.name == "Warlock") {
            subclass = fiend;
        }
        
        int armorClass = 10+abilityModifiers[1];

        // create character
        character = CharacterModel(
            name: name,
            charClass: charClass,
            subclass: subclass,
            race: race,
            background: background,
            abilityScores: abilityScores,
            spells: spells,
            maxSpellSlots: maxSpellSlots,
            currSpellSlots: currSpellSlots,
            maxHitPoints: maxHitPoints,
            currHitPoints: currHitPoints,
            armorClass: armorClass,
            speed: 30,
            hitDice: determinedHitDice,
        );

        // add character to list
        characterListViewModel.addCharacter(character);
    }
}