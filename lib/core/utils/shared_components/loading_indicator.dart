import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellow,
      ),
    );
  }
}
