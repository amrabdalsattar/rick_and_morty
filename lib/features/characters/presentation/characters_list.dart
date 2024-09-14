import 'package:flutter/material.dart';
import 'character_card.dart';
import '../data/models/character_response.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  const CharactersList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3),
            itemCount: characters.length,
            itemBuilder: (context, index) =>
                CharacterCard(character: characters[index]),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
