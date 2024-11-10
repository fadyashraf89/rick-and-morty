import "package:flutter/material.dart";

import "Constants/Strings.dart";
import "Presentation/screens/CharacterDetails.dart";
import "Presentation/screens/CharactersScreen.dart";
class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case kAllCharactersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const AllCharactersScreen()
        );
      case kCharacterDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen()
        );
    }
  }
}