import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';

class CharacterModel {
    String name;
    CharacterOption charClass;
    // the subclass is optional, so it is a nullable type (hence the ?)
    CharacterOption? subclass;
    CharacterOption background;
    CharacterOption race;

    List<int> abilityScores;
    List<Spell>? spells;
    int? maxSpellSlots;
    int? currSpellSlots;
    int maxHitPoints;
    int currHitPoints;
    int armorClass;
    int speed;
    int hitDice;

    // late because they are built in the constructor
    late List<int> skillProficiencyNums = [];
    late List<String> otherProficiencies = [];
    late List<int> abilityModifiers = [];
    late int currHitDice = 1;
    late int maxHitDice = 1;
    late String inventory = "+ Add Items";
    late List<String> attackList = [];

    CharacterModel({
        required this.name,
        required this.charClass,
        this.subclass,    // subclass is optional
        required this.background,
        required this.race,
        required this.abilityScores,
        this.spells,
        this.maxSpellSlots,
        this.currSpellSlots,
        required this.maxHitPoints,
        required this.currHitPoints,
        required this.armorClass,
        required this.speed,
        required this.hitDice,
    }) {
        // combine proficiency lists
        skillProficiencyNums = charClass.getSkillProficiencies;
        skillProficiencyNums.addAll(background.getSkillProficiencies);

        otherProficiencies = charClass.getOtherProficiencies;
        otherProficiencies.addAll(background.getOtherProficiencies);

        // conditionally add subclass proficiencies
        if (subclass != null) {
            skillProficiencyNums.addAll(subclass?.getSkillProficiencies as Iterable<int>);
            otherProficiencies.addAll(subclass?.getOtherProficiencies as Iterable<String>);
        }

        // construct ability modifiers
        for (int score in abilityScores) {
            abilityModifiers.add(((score-10)/2).floor());
        }
    }

    // constructor from json
    factory CharacterModel.fromJson(Map<String, dynamic> json) {
        return CharacterModel(
            name: json["Name"],
            charClass: json["Class"],
            subclass: json["Subclass"],
            background: json["Background"],
            race: json["Race"],
            abilityScores: json["Ability Scores"],
            spells: json["Spells"],
            maxSpellSlots: json["Max Spell Slots"],
            currSpellSlots: json["Current Spell Slots"],
            maxHitPoints: json["Max Hit Points"],
            currHitPoints: json["Current Hit Points"],
            armorClass: json["Armor Class"],
            speed: json["Speed"],
            hitDice: json["Hit Dice"]
        );
    }

    // getters and setters for the class
    String get getName => name;
    set setName(String name) => this.name = name;

    CharacterOption get getCharClass => charClass;
    set setCharClass(CharacterOption charClass) => this.charClass = charClass;

    CharacterOption? get getSubclass => subclass;
    set setSubclass(CharacterOption? subclass) => this.subclass = subclass;

    CharacterOption get getBackground => background;
    set setBackground(CharacterOption background) => this.background = background;

    CharacterOption get getRace => race;
    set setRace(CharacterOption race) => this.race = race;

    List<int> get getAbilityScores => abilityScores;
    set setAbilityScores(List<int> abilityScores) => this.abilityScores = abilityScores;

    List<int> get getAbilityModifiers => abilityModifiers;
    set setAbilityModifiers(List<int> abilityModifiers) => this.abilityModifiers = abilityModifiers;

    List<Spell>? get getSpells => spells;
    set setSpells(List<Spell> spells) => this.spells = spells;

    int? get getCurrSpellSlots => currSpellSlots;
    set setCurrSpellSlots(int currSpellSlots) => this.currSpellSlots = currSpellSlots;

    int get getCurrHitPoints => currHitPoints;
    set setCurrHitPoints(int currHitPoints) => this.currHitPoints = currHitPoints;

    int get getMaxHitPoints => maxHitPoints;
    set setMaxHitPoints(int maxHitPoints) => this.maxHitPoints = maxHitPoints;

    int? get getMaxSpellSlots => maxSpellSlots;
    set setMaxSpellSlots(int maxSpellSlots) => this.maxSpellSlots = maxSpellSlots;

    int get getArmorClass => armorClass;
    set setArmorClass(int armorClass) => this.armorClass = armorClass;

    int get getSpeed => speed;
    set setSpeed(int speed) => this.speed = speed;

    int get getHitDice => hitDice;
    set setHitDice(int hitDice) => this.hitDice = hitDice;

    int get getCurrHitDice => currHitDice;
    set setCurrHitDice(int currHitDice) => this.currHitDice = currHitDice;

    int get getMaxHitDice => maxHitDice;
    set setMaxHitDice(int maxHitDice) => this.maxHitDice = maxHitDice;

    String get getInventory => inventory;
    set setInventory(String inventory) => this.inventory = inventory;

    List<String> get getAttackList => attackList;
    set setAttackList(List<String> attackList) => this.attackList = attackList;

    List<int> getSavingThrows() {
        switch (charClass.name) {
            case "Barbarian":
                return [abilityModifiers[0]+2, abilityModifiers[1], abilityModifiers[2]+2, abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]];
            case "Bard":
                return [abilityModifiers[0], abilityModifiers[1]+2, abilityModifiers[2], abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]+2];
            case "Cleric":
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2], abilityModifiers[3], abilityModifiers[4]+2, abilityModifiers[5]+2];
            case "Druid":
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2], abilityModifiers[3]+2, abilityModifiers[4]+2, abilityModifiers[5]];
            case "Fighter":
                return [abilityModifiers[0]+2, abilityModifiers[1], abilityModifiers[2]+2, abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]];
            case "Monk":
                return [abilityModifiers[0]+2, abilityModifiers[1]+2, abilityModifiers[2], abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]];
            case "Paladin":
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2], abilityModifiers[3]+2, abilityModifiers[4], abilityModifiers[5]+2];
            case "Ranger":
                return [abilityModifiers[0]+2, abilityModifiers[1]+2, abilityModifiers[2], abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]];
            case "Rogue":
                return [abilityModifiers[0], abilityModifiers[1]+2, abilityModifiers[2], abilityModifiers[3]+2, abilityModifiers[4], abilityModifiers[5]];
            case "Sorcerer":
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2]+2, abilityModifiers[3], abilityModifiers[4], abilityModifiers[5]+2];
            case "Warlock":
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2], abilityModifiers[3], abilityModifiers[4]+2, abilityModifiers[5]+2];
            default: // Wizard
                return [abilityModifiers[0], abilityModifiers[1], abilityModifiers[2], abilityModifiers[3]+2, abilityModifiers[4]+2, abilityModifiers[5]];
        }
    }
}