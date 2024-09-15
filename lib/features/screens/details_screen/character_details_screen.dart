import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/characters/data/models/character_response.dart';

import 'widgets/custom_sliver_app_bar.dart';
part 'widgets/character_info.dart';

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
          SliverList(
            delegate: SliverChildListDelegate([
              CharacterInfo(
                leadingText: 'Gender',
                titleText: character.gender!,
                dividerPercentFromScreenWidth: 0.15,
              ),
              CharacterInfo(
                leadingText: 'Origin',
                titleText: character.origin!.name!,
                dividerPercentFromScreenWidth: 0.35,
              ),
              CharacterInfo(
                leadingText: 'Episodes',
                titleText: character.episode!.length.toString(),
                dividerPercentFromScreenWidth: 0.25,
              ),
              CharacterInfo(
                leadingText: 'Species',
                titleText: character.species!,
                dividerPercentFromScreenWidth: 0.2,
              ),
              CharacterInfo(
                leadingText: 'Location',
                titleText: character.location!.name!,
                dividerPercentFromScreenWidth: 0.4,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.55,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
