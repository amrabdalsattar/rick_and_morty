import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/shared_components/loading_indicator.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;
  const CharacterImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        height: double.infinity,
        imageUrl: imageUrl,
        placeholder: (_, __) => const LoadingIndicator(),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
