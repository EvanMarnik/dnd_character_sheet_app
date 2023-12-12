import 'package:flutter/material.dart';

import 'package:dnd_character_sheet_app/constants.dart';

import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

class CharacterListView extends StatefulWidget {
  CharacterListViewModel characterListViewModel;

  CharacterListView({required this.characterListViewModel});

  @override
  State<CharacterListView> createState() => _CharacterListViewState(characterListViewModel: characterListViewModel);
}

class _CharacterListViewState extends State<CharacterListView> {

  CharacterListViewModel characterListViewModel;

  _CharacterListViewState({required this.characterListViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width*0.1, 0, MediaQuery.of(context).size.width*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Character',
              style: TextStyle(
                color: Color(0xFFAD9090),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Scrollbar(child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: characterListViewModel.characterList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, sheetRoute, arguments: characterListViewModel.characterList[index]);
                                },
                                child: Text(
                                    '${characterListViewModel.characterList[index].name}\n${characterListViewModel.characterList[index].race.name}\n${characterListViewModel.characterList[index].charClass.name}\n${characterListViewModel.characterList[index].background.name}',
                                    textAlign: TextAlign.center
                                ),
                              ),
                            )
                        );
                      }
                  ))
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 350,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, creatorRoute, arguments: characterListViewModel);
                    },
                    child: const Text('Create Character'),
                  )
                )
              ]
            ),
          ]
        )
      ),
    );
  }
}