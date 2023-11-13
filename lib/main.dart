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
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const Text('Home'),
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: const TextStyle(fontSize: 20),
//               ),
//               onPressed: (){
//                 Navigator.pushNamed(context, sheetRoute, arguments: 0);
//               },
//               child: const Text('Coddrin Thunderslayer'),
//             )
//           ],
//         )
//       ),
//     );
//   }
// }


// class Feed extends StatelessWidget {
//   final String data;

//   Feed(this.data);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//              Text('Feed: $data'),
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: const TextStyle(fontSize: 20),
//               ),
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//               child: const Text('Back'),
//             )
//           ],
//         ),
//       ),
//     );

//   }
// }