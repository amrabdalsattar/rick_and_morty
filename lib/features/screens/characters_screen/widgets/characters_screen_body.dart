import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/shared_components/loading_indicator.dart';
import '../../../characters/logic/characters_cubit/characters_cubit.dart';
import '../../../characters/logic/characters_filtration_cubit/characters_filtration_cubit.dart';
import '../../../characters/presentation/characters_list.dart';

class CharactersScreenBody extends StatelessWidget {
  const CharactersScreenBody({
    super.key,
    required this.charactersCubit,
    required this.charactersFiltrationCubit,
  });

  final CharactersCubit charactersCubit;
  final CharactersFiltrationCubit charactersFiltrationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => charactersCubit,
      child: BlocBuilder<CharactersCubit, CharactersState>(
        bloc: charactersCubit,
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const LoadingIndicator();
          } else if (state is CharactersError) {
            return const Text("Error");
          } else if (state is CharactersSuccess) {
            return CharactersList(
              characters:
                  charactersFiltrationCubit.searchController.text.isEmpty
                      ? charactersCubit.myCharacters
                      : charactersFiltrationCubit.characterSearchResult,
            );
          } else {
            return const Text("Unknown Error");
          }
        },
      ),
    );
  }
}
