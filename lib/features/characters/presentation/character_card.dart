import 'package:flutter/material.dart';

import '../data/models/character_response.dart';
import 'character_widgets/character_image.dart';
import 'character_widgets/character_name_footer.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CharacterImage(imageUrl: character.image!),
            CharacterNameFooter(characterName: character.name!)
          ],
        ),
      ),
    );
  }
}
