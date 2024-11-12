import 'package:flutter/material.dart';

import '../../Data/models/Characters.dart';
import 'CharacterItem.dart';

class BuildCharactersList extends StatelessWidget {
  const BuildCharactersList({
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) => CharacterItem(
        character: SearchTextController.text.isEmpty
            ? allCharacters![index]
            : searchResultCharacters![index],
      ),
      itemCount: SearchTextController.text.isEmpty
          ? allCharacters?.length
          : searchResultCharacters?.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
