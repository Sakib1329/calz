import 'package:flutter/material.dart';
import 'colors.dart';

class AppInputDecoration {
  static InputDecoration input({
    String? hint,
    Widget? suffixicon,
    Widget? prefixicon,
    VoidCallback? onSuffixTap,
  }) =>
      InputDecoration(
        prefixIcon: prefixicon,
        hintText: hint,
        prefixIconColor: AppColors.mediumGray ,
        labelStyle: TextStyle(color: AppColors.mediumGray),
        hintStyle: TextStyle(color: AppColors.mediumGray),
        filled: true,
        fillColor: AppColors.pureWhite,
        suffixIconColor: AppColors.mediumGray,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGrayBlue, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGrayBlue, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGrayBlue),
        ),
        // Only show suffixIcon if icondata is not null
        suffixIcon: suffixicon != null
            ? IconButton(onPressed: onSuffixTap, icon: suffixicon)
            : null,
      );
}
