class CharacterModel {
    String name;
    
    // (className, List<(featureName, featureDescription)>, List<(otherProficiencyName)>, List<(skillProficiencyNum)>)
    (String, List<(String, String)>, List<String>, List<int>) charClass;

    // (subclassName, List<(featureName, featureDescription)>, List<(otherProficiencyName)>, List<(skillProficiencyNum)>)
    // the subclass is optional, so it is a nullable type (hence the ?)
    (String, List<(String, String)>, List<String>, List<int>)? subclass;
    
    // (backgroundName, List<(featureName, featureDescription)>, List<(otherProficiencyName)>, List<(skillProficiencyNum)>)
    (String, List<(String, String)>, List<String>, List<int>) background;

    // (raceName, List<(featureName, featureDescription)>, List<(otherProficiencyName)>, List<(skillProficiencyNum)>)
    (String, List<(String, String)>, List<String>, List<int>) race;

    List<int> abilityScores;
    List<String>? spells;
    const int? maxSpellSlots;
    int? currSpellSlots;
    const int maxHitPoints;
    int currHitPoints;

    List<int> skillProficiencyNums;
    List<String> otherProficiencies;

    CharacterModel({
        required this.name,
        required this.charClass,
        [this.subclass],    // subclass is optional
        required this.background,
        required this.race,
        required this.abilityScores,
        [this.spells],
        [this.maxSpellSlots],
        [this.currSpellSlots],
        required this.maxHitPoints,
        required this.currHitPoints,
    }) {
        // combine proficiency lists
        skillProficiencyNums = charClass[3];
        skillProficiencyNums.addAll(subclass[3]);
        skillProficiencyNums.addAll(background[3]);

        otherProficiencies = charClass[2];
        otherProficiencies.addAll(subclass[2]);
        otherProficiencies.addAll(background[2]);
    };

    // constructor from json
    factory CharacterModel.fromJson(Map<String, dynamic> json) {
        return CharacterModel(
            name: json["Name"],
            charClass: json["Class"],
            [subclass: json["Subclass"]],
            background: json["Background"],
            race: json["Race"],
            abilityScores: json["Ability Scores"],
            [spells: json["Spells"]],
            [maxSpellSlots: json["Max Spell Slots"]],
            [currSpellSlots: json["Current Spell Slots"]],
            maxHitPoints: json["Max Hit Points"],
            currHitPoints: json["Current Hit Points"],
        );
    }

    // getters and setters for the class
    String get getName => name;
    set setName(String name) => this.name = name;

    (String, List<(String, String)>, List<(String)>) get getCharClass => charClass;
    set setCharClass((String, List<(String, String)>, List<(String)>) charClass) => this.charClass = charClass;

    (String, List<(String, String)>, List<(String)>) get getSubclass => subclass;
    set setSubclass((String, List<(String, String)>, List<(String)>) subclass) => this.subclass = subclass;

    (String, List<(String, String)>, List<(String)>) get getBackground => background;
    set setBackground((String, List<(String, String)>, List<(String)>) background) => this.background = background;

    (String, List<(String, String)>, List<(String)>) get getRace => race;
    set setRace((String, List<(String, String)>, List<(String)>) race) => this.race = race;

    List<int> get getAbilityScores => abilityScores;
    set setAbilityScores(List<int> abilityScores) => this.abilityScores = abilityScores;

    List<String> get getSpells => spells;
    set setSpells(List<String> spells) => this.spells = spells;

    int get getCurrSpellSlots => currSpellSlots;
    set setCurrSpellSlots(int currSpellSlots) => this.currSpellSlots = currSpellSlots;

    int get getCurrHitPoints => currHitPoints;
    set setCurrHitPoints(int currHitPoints) => this.currHitPoints = currHitPoints;
}
