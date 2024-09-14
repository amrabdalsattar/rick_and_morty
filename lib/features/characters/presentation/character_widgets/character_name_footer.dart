import 'package:flutter/material.dart';

class CharacterNameFooter extends StatelessWidget {
  const CharacterNameFooter({
    super.key,
    required this.characterName,
  });

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Text(
          characterName,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.3),
        ));
  }
}
