import 'package:flutter/material.dart';
import '../../../characters/logic/characters_cubit/characters_cubit.dart';
import '../../../characters/logic/characters_filtration_cubit/characters_filtration_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import 'search_text_field.dart';

class CustomAppBar extends StatefulWidget {
  final CharactersFiltrationCubit charactersFiltrationCubit;
  final CharactersCubit charactersCubit;
  const CustomAppBar(
      {super.key,
      required this.charactersFiltrationCubit,
      required this.charactersCubit});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: widget.charactersFiltrationCubit.buildAppBarAction(
                  widget.charactersFiltrationCubit.isSearching, context)),
        ],
        backgroundColor: AppColors.yellow,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        title: toggleAppBarTitle());
  }

  Widget toggleAppBarTitle() {
    Widget appBarTitle;
    widget.charactersFiltrationCubit.isSearching
        ? appBarTitle = SearchTextField(
            controller: widget.charactersFiltrationCubit.searchController,
            onChanged: (query) {
              widget.charactersFiltrationCubit.searchForCharacter(
                  query, widget.charactersCubit.myCharacters);
            },
          )
        : appBarTitle = const Text(
            'Characters',
            style: TextStyle(color: AppColors.grey),
          );
    return appBarTitle;
  }
}
