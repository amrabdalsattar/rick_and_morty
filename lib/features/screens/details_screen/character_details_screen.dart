import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/characters/data/models/character_response.dart';

import 'widgets/custom_sliver_app_bar.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(character: character),
        ],
      ),
    );
  }
}
