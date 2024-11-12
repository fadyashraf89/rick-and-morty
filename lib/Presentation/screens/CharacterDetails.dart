import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty/Data/models/Characters.dart';

import '../widgets/BuildDivider.dart';
import '../widgets/BuildSliverAppbar.dart';
import '../widgets/CharacterInfo.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final MyCharacters character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppbar(character: character, context: context),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                          title: "Species: ", value: character.species),
                      BuildDivider(endIndent: 285),
                      CharacterInfo(title: "Status: ", value: character.status),
                      BuildDivider(endIndent: 290),
                      CharacterInfo(title: "Gender: ", value: character.gender),
                      BuildDivider(endIndent: 280),
                      CharacterInfo(title: "Type: ", value: character.type),
                      BuildDivider(endIndent: 280),
                      CharacterInfo(
                          title: "Origin : ", value: character.originName),
                      BuildDivider(endIndent: 280),
                      CharacterInfo(
                          title: "Location: ", value: character.locationName),
                    ])),
            const SizedBox(height: 480),
          ]))
        ],
      ),
    );
  }
}
