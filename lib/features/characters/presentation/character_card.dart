import 'package:flutter/material.dart';

import 'package:rick_and_morty/features/characters/data/models/character_response.dart';
import 'package:rick_and_morty/features/characters/presentation/character_widgets/character_image.dart';

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
            Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Text(
                  character.name!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.3),
                ))
          ],
        ),
      ),
    );
  }
}
