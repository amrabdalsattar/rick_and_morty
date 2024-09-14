part of '../characters_screen.dart';

class CustomAppBar extends StatelessWidget {
  final CharactersFiltrationCubit charactersFiltrationCubit;
  final CharactersCubit charactersCubit;
  const CustomAppBar(
      {super.key,
      required this.charactersFiltrationCubit,
      required this.charactersCubit});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: charactersFiltrationCubit.buildAppBarAction(
                charactersFiltrationCubit.isSearching, context)),
      ],
      backgroundColor: AppColors.yellow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      title: toggleAppBarTitle(),
    );
  }

  Widget toggleAppBarTitle() {
    Widget appBarTitle;
    charactersFiltrationCubit.isSearching
        ? appBarTitle = SearchTextField(
            controller: charactersFiltrationCubit.searchController,
            onChanged: (query) {
              charactersFiltrationCubit.searchForCharacter(
                  query, charactersCubit.myCharacters);
            },
          )
        : appBarTitle = const Text(
            'Characters',
            style: TextStyle(color: AppColors.grey, fontSize: 20),
          );
    return appBarTitle;
  }
}
