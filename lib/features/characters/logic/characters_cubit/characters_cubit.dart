import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/character_response.dart';
import '../../data/repositories/characters_repository.dart';

part 'characters_state.dart';

@injectable
class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repo}) : super(CharactersInitial());

  CharactersRepository repo;
  List<Character> myCharacters = [];

  void getAllCharacters() async {
    emit(CharactersLoading());
    List<Character> characters = await repo.getAllCharacters();
    if (characters.isEmpty) {
      emit(CharactersError(errorMessage: 'There is no Characters available'));
    } else {
      myCharacters = characters;
      emit(CharactersSuccess(characters: myCharacters));
    }
  }
}
