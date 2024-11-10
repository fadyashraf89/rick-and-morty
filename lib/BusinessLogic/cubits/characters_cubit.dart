import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/models/Characters.dart';
import '../../Data/repository/CharactersRepository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  late List<Characters> characters;
  CharactersCubit(this.repository) : super(CharactersInitial());

  List<Characters> getAllCharacters(){
    repository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters!));
      this.characters = characters;
    });
    return characters;
  }
}
