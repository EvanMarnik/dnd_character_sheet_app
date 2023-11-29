class Spell {
  String name;
  String desc;
  int level;
  String school;
  String castingTime;
  String range;
  String components;
  String duration;

  Spell({
    required this.name,
    required this.desc,
    required this.level,
    required this.school,
    required this.castingTime,
    required this.range,
    required this.components,
    required this.duration
  });

  // getters and setters
    String get getName => name;
    String get getDesc => desc;
    int get getLevel => level;
    String get getSchool => school;
    String get getCastingTime => castingTime;
    String get getRange => range;
    String get getComponents => components;
    String get getDuration => duration;

    set setName(String name) => this.name = name;
    set setDesc(String desc) => this.desc = desc;
    set setLevel(int level) => this.level = level;
    set setSchool(String school) => this.school = school;
    set setCastingTime(String castingTime) => this.castingTime = castingTime;
    set setRange(String range) => this.range = range;
    set setComponents(String components) => this.components = components;
    set setDuration(String duration) => this.duration = duration;
}
