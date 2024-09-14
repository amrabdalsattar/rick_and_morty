import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../characters/data/models/character_response.dart';
import '../../../characters/presentation/character_widgets/character_image.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(80, 0, 0, 0)),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ))),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      expandedHeight: MediaQuery.sizeOf(context).height * 0.5,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id!,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CharacterImage(imageUrl: character.image!),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.08,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(101, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
              )
            ],
          ),
        ),
        title: Text(
          character.name!,
          style: const TextStyle(color: AppColors.white, fontSize: 18),
        ),
      ),
      backgroundColor: AppColors.grey,
    );
  }
}
