import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_rickandmorty/BusinessLogic/cubits/characters_cubit.dart";
import "package:flutter_rickandmorty/Data/WebServices/CharactersWebServices.dart";
import "package:flutter_rickandmorty/Data/repository/CharactersRepository.dart";

import "Constants/Strings.dart";
import "Presentation/screens/CharacterDetails.dart";
import "Presentation/screens/CharactersScreen.dart";

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kAllCharactersScreenRoute:
        return MaterialPageRoute(
            builder: (builder) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: const AllCharactersScreen(),
                ));
      case kCharacterDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (builder) => const CharacterDetailsScreen());
    }
    return null;
  }
}
