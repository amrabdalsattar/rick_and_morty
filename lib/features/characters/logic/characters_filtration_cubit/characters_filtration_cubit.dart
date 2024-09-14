import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character_response.dart';

part 'search_state.dart';

class CharactersFiltrationCubit extends Cubit {
  CharactersFiltrationCubit() : super(SearchCubitInitial());

  List<Character> characterSearchResult = [];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  void searchForCharacter(String keyWord, List<Character> allCharactersList) {
    characterSearchResult = allCharactersList
        .where(
          (character) => character.name!.toLowerCase().contains(keyWord),
        )
        .toList();
    emit(keyWord);
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(SearchStarted());
  }

  void stopSearch() {
    clearSearch();
    isSearching = false;
    emit(SearchStopped());
  }

  void clearSearch() {
    searchController.text = '';
    emit(SearchStopped());
  }

  Widget buildAppBarAction(bool isSearching, BuildContext ctx) {
    if (isSearching) {
      return IconButton(
        onPressed: () {
          clearSearch();
          Navigator.pop(ctx);
        },
        icon: const Icon(Icons.clear),
      );
    } else {
      return IconButton(
        onPressed: () {
          startSearch(ctx);
        },
        icon: const Icon(Icons.search),
      );
    }
  }
}
