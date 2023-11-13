import 'package:flutter/material.dart';

import 'package:character_sheet_dnd/view_model/character_creator_view_model.dart';
import 'package:character_sheet_dnd/view_model/character_list_view_model.dart';
import 'package:character_sheet_dnd/view_model/character_sheet_view_model.dart';

import 'package:character_sheet_dnd/view/character_creator_view.dart';
import 'package:character_sheet_dnd/view/character_list_view.dart';
import 'package:character_sheet_dnd/view/character_sheet_view.dart';

import 'package:provider/provider.dart';

import 'constants.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case listRoute:
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
              create: (context) => CharacterListViewModel(),
              child: CharacterListView(),
            )
        );
      case sheetRoute:
        var charID = settings.arguments as int;
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
                create: (context) => CharacterSheetViewModel(),
                child: CharacterSheetView(charID),
            )
        );
      case creatorRoute:
        return MaterialPageRoute(builder: (_) =>
            ChangeNotifierProvider(
                create: (context) => CharacterCreatorViewModel(),
                child: CharacterCreatorView(),
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