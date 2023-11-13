import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/character_option.dart';

class CharacterModel {
    String name;
    CharacterOption charClass;
    // the subclass is optional, so it is a nullable type (hence the ?)
    CharacterOption? subclass;
    CharacterOption background;
    CharacterOption race;

    List<int> abilityScores;
    List<String>? spells;
    int? maxSpellSlots;
    int? currSpellSlots;
    int maxHitPoints;
    int currHitPoints;

    // late because they are built in the constructor
    late List<int> skillProficiencyNums;
    late List<String> otherProficiencies;

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
    }) {
        // combine proficiency lists
        skillProficiencyNums = charClass.getSkillProficiencies;
        skillProficiencyNums.addAll(subclass?.getSkillProficiencies as Iterable<int>);
        skillProficiencyNums.addAll(background.getSkillProficiencies);

        otherProficiencies = charClass.getOtherProficiencies;
        otherProficiencies.addAll(subclass?.getOtherProficiencies as Iterable<String>);
        otherProficiencies.addAll(background.getOtherProficiencies);
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

    List<String>? get getSpells => spells;
    set setSpells(List<String> spells) => this.spells = spells;

    int? get getCurrSpellSlots => currSpellSlots;
    set setCurrSpellSlots(int currSpellSlots) => this.currSpellSlots = currSpellSlots;

    int get getCurrHitPoints => currHitPoints;
    set setCurrHitPoints(int currHitPoints) => this.currHitPoints = currHitPoints;
}