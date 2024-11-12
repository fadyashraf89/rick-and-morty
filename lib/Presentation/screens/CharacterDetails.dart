import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty/Data/models/Characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final MyCharacters character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo("Species: ", character.species),
                      BuildDivider(285),
                      CharacterInfo("Status: ", character.status),
                      BuildDivider(290),
                      CharacterInfo("Gender: ", character.gender),
                      BuildDivider(280),
                      CharacterInfo("Type: ", character.type),
                      BuildDivider(280),
                      CharacterInfo("Origin : ", character.originName),
                      BuildDivider(280),
                      CharacterInfo("Location: ", character.locationName),
                    ])),
            const SizedBox(height: 500),
          ]))
        ],
      ),
    );
  }

  Widget CharacterInfo(String title, String? value) {
    return RichText(
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          TextSpan(
            text: (value == null || value.isEmpty) ? 'N/A' : value,
            // Check for empty string
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }

  Widget BuildDivider(double endIndent) {
    return Divider(
      color: Colors.white,
      height: 30,
      endIndent: endIndent,
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
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
