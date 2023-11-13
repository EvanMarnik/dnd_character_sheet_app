class Feature {
  String name;
  String desc;

  Feature({
    required this.name,
    required this.desc
  });

  // getters and setters
  String get getName => name;
  String get getDesc => desc;

  set setName(String name) => this.name = name;
  set setDesc(String desc) => this.desc = desc;
}
