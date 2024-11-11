part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<MyCharacters> characters;

  CharactersLoaded(this.characters);
}

class CharactersFailed extends CharactersState {}
