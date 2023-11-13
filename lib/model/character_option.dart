import 'package:dnd_character_sheet_app/model/feature.dart';

class CharacterOption {
  String name;
  List<Feature> features;
  List<String> otherProficiencies;
  List<int> skillProficiencies;
  CharacterOption({
    required this.name,
    required this.features,
    required this.otherProficiencies,
    required this.skillProficiencies
  });

  // getters and setters
  String get getName => name;
  List<Feature> get getFeatures => features;
  List<String> get getOtherProficiencies => otherProficiencies;
  List<int> get getSkillProficiencies => skillProficiencies;

  set setName(String name) => this.name = name;
  set setFeatures(List<Feature> features) => this.features = features;
  set setOtherProficiencies(List<String> otherProficiencies) => this.otherProficiencies = otherProficiencies;
  set setSkillProficiencies(List<int> skillProficiencies) => this.skillProficiencies = skillProficiencies;
}