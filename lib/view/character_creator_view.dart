import 'package:flutter/material.dart';
import 'package:dnd_character_sheet_app/constants.dart';
import 'package:dnd_character_sheet_app/view_model/character_list_view_model.dart';

class CharacterCreatorView extends StatefulWidget {
  CharacterListViewModel characterListViewModel;

  CharacterCreatorView(this.characterListViewModel);

  @override
  State<CharacterCreatorView> createState() => _CharacterCreatorViewState(characterListViewModel: characterListViewModel);
}

class _CharacterCreatorViewState extends State<CharacterCreatorView> {
  CharacterListViewModel characterListViewModel;

  _CharacterCreatorViewState({required this.characterListViewModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFAD9090),
          title: const Text('Character Creator', style: TextStyle(color: const Color(0xFF302727))),
        ),
        body: Center(
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
                            height: MediaQuery.of(context).size.height*0.8,
                            child: ListView.builder(
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
                            )
                        )
                      ]
                  ),
                ]
            )
        )
    );
  }
}