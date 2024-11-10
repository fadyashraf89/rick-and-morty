import 'package:flutter_rickandmorty/Data/WebServices/CharactersWebServices.dart';

import '../models/Characters.dart';

class CharactersRepository{
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Characters>?> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Characters.fromJson(character)).toList();
  }

}