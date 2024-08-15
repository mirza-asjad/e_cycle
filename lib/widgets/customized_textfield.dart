import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
        border: InputBorder.none,
      ),
      style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
    );
  }
}
