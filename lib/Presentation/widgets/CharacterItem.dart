import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty/Constants/colors.dart';
import 'package:flutter_rickandmorty/Data/models/Characters.dart';

class CharacterItem extends StatelessWidget {
  final MyCharacters character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: MyColors.BlackColor,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: character.image,
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: Colors.black,
                )),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black.withOpacity(0.6),
          alignment: Alignment.bottomCenter,
          child: Text(character.name,
            style: TextStyle(
            height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
              textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}