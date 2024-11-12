import 'package:flutter/material.dart';

import '../../Data/models/Characters.dart';
import 'BuildCharactersList.dart';

class BuildLoadedListWidgets extends StatelessWidget {
  const BuildLoadedListWidgets({
    super.key,
    required this.SearchTextController,
    required this.allCharacters,
    required this.searchResultCharacters,
  });

  final TextEditingController SearchTextController;
  final List<MyCharacters>? allCharacters;
  final List<MyCharacters>? searchResultCharacters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          BuildCharactersList(
              SearchTextController: SearchTextController,
              allCharacters: allCharacters,
              searchResultCharacters: searchResultCharacters),
        ]),
      ),
    );
  }
}
