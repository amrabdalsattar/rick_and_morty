import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const SearchTextField({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.grey,
      decoration: const InputDecoration(
        hintText: 'Find your character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.grey, fontSize: 18),
      ),
      style: const TextStyle(color: AppColors.grey, fontSize: 18),
      onChanged: onChanged,
    );
  }
}
