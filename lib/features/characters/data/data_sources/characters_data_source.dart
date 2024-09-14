import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_factory.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../models/character_response.dart';

@injectable
class CharactersDataSource {
  const CharactersDataSource(this.apiFactory);

  final ApiFactory apiFactory;

  Future<List<Character>> getAllCharacters() async {
    final serverResponse = await apiFactory.get(charactersEndPoint);
    CharacterResponse characterResponse =
        CharacterResponse.fromJson(serverResponse);
    if (characterResponse.results != null) {
      return characterResponse.results!;
    } else {
      return [];
    }
  }
}
