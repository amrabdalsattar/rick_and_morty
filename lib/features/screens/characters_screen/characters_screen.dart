import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/custom_app_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../../characters/logic/characters_cubit/characters_cubit.dart';
import '../../characters/logic/characters_filtration_cubit/characters_filtration_cubit.dart';
import '../../../core/di/di.dart';

import 'widgets/characters_screen_body.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersCubit charactersCubit = getIt<CharactersCubit>();
  CharactersFiltrationCubit charactersFiltrationCubit =
      CharactersFiltrationCubit();

  @override
  void initState() {
    super.initState();
    charactersCubit.getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => charactersFiltrationCubit,
      child: BlocBuilder<CharactersFiltrationCubit, dynamic>(
        bloc: charactersFiltrationCubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.grey,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                charactersFiltrationCubit: charactersFiltrationCubit,
                charactersCubit: charactersCubit,
              ),
            ),
            body: CharactersScreenBody(
                charactersCubit: charactersCubit,
                charactersFiltrationCubit: charactersFiltrationCubit),
          );
        },
      ),
    );
  }
}
