import 'package:flutter/material.dart';

import 'router.dart' as LocalRouter;
import 'constants.dart';

import 'package:dnd_character_sheet_app/view/character_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: CharacterListView(),
        ),
        onGenerateRoute: LocalRouter.Router.generateRoute,
        initialRoute: listRoute,
    );

  }
}
