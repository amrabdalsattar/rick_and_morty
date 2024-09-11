import 'package:flutter/material.dart';
import 'constants/app_strings.dart';
import '../../features/screens/characters_screen/characters_screen.dart';
import '../../features/screens/details_screen/character_details_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRouteName:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

      case characterDetailsScreenRouteName:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
    return null;
  }
}
