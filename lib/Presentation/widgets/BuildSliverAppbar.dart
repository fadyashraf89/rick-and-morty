import 'package:flutter/material.dart';

import '../../Data/models/Characters.dart';

class BuildSliverAppbar extends StatelessWidget {
  const BuildSliverAppbar({
    super.key,
    required this.character,
    required this.context,
  });

  final MyCharacters character;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      pinned: true,
      stretch: true,
      centerTitle: true,
      expandedHeight: MediaQuery.of(context).size.height - 150,
      // Use MediaQuery
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            character.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
