import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/models/character_response.dart';
import 'constants/app_strings.dart';
import '../../features/screens/characters_screen/characters_screen.dart';
import '../../features/screens/details_screen/character_details_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home screen route
      case homeScreenRouteName:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

      // Details screen route
      case characterDetailsScreenRouteName:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
                  character: character,
                ));
    }
    return null;
  }
}
