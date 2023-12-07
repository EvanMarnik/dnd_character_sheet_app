import 'package:flutter/material.dart';

import 'package:dnd_character_sheet_app/model/character_model.dart';

import 'package:dnd_character_sheet_app/view_model/character_creator_view_model.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';
import 'package:dnd_character_sheet_app/view_model/character_sheet_view_model.dart';

import 'package:dnd_character_sheet_app/view/character_creator_view.dart';
import 'package:dnd_character_sheet_app/view/character_list_view.dart';
import 'package:dnd_character_sheet_app/view/character_sheet_view.dart';

import 'package:provider/provider.dart';

import 'constants.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case listRoute:
        var characterListViewModel = settings.arguments as CharacterListViewModel;
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
              create: (context) => CharacterListViewModel(),
              child: CharacterListView(characterListViewModel: characterListViewModel),
            )
        );
      case sheetRoute:
        var characterModel = settings.arguments as CharacterModel;
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
                create: (context) => CharacterSheetViewModel(characterModel: characterModel),
                child: CharacterSheetView(characterModel),
            )
        );
      case creatorRoute:
        var characterListViewModel = settings.arguments as CharacterListViewModel;
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
                create: (context) => CharacterCreatorViewModel(characterListViewModel: characterListViewModel),
                child: CharacterCreatorView(characterListViewModel),
            )
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}