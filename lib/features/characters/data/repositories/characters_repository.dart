import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../data_sources/characters_data_source.dart';
import '../models/character_response.dart';

@injectable
class CharactersRepository {
  CharactersRepository(
      {required this.connectionChecker, required this.dataSource});

  final InternetConnectionChecker connectionChecker;
  final CharactersDataSource dataSource;

  Future<List<Character>> getAllCharacters() async {
    bool connectedToInternet = await connectionChecker.hasConnection;

    if (connectedToInternet) {
      return dataSource.getAllCharacters();
    } else {
      return [];
    }
  }
}
