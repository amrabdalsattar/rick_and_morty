import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/utils/shared_components/loading_indicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../characters/logic/cubit/characters_cubit.dart';
import '../../characters/presentation/characters_list.dart';

import '../../../core/di/di.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersCubit charactersCubit = getIt<CharactersCubit>();

  @override
  void initState() {
    super.initState();
    charactersCubit.getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          )
        ],
        backgroundColor: AppColors.yellow,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        title: const Text(
          'Characters',
          style: TextStyle(color: AppColors.grey),
        ),
      ),
      body: BlocProvider(
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
                characters: charactersCubit.myCharacters,
              );
            } else {
              return const Text("Unknown Error");
            }
          },
        ),
      ),
    );
  }
}
