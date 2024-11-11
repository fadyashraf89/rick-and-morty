import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/models/Characters.dart';
import '../../Data/repository/CharactersRepository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  List<MyCharacters>? characters;
  CharactersCubit(this.repository) : super(CharactersInitial());

  List<MyCharacters>? getAllCharacters(){
    repository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
