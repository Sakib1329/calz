import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/texfiled.dart'; // AppInputDecoration class

class CustomTextFieldForSetting extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isReadOnly;
  final IconData? suffixicon;
  final IconData? prefixicon;// Now an IconData
  final VoidCallback? onSuffixTap;
  final bool isEditable;
  final TextInputType textInputType;

  const CustomTextFieldForSetting({
    super.key,
    required this.textInputType,
    this.label = "",
    required this.hintText,
    this.controller,
    this.prefixicon,
    this.isPassword = false,
    this.isReadOnly = false,
    this.suffixicon,
    this.onSuffixTap,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.darkOlive,
          ),
        ),
        SizedBox(height: 6),
        // Text Field
        TextField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: isPassword,
          obscuringCharacter: "*",
          readOnly: isReadOnly,
          cursorColor: AppColors.darkOlive,
          style: TextStyle(color: AppColors.darkOlive),
          decoration: AppInputDecoration.input(
            hint: hintText,
            onSuffixTap: onSuffixTap,
            suffixicon: suffixicon != null ? Icon(suffixicon) : null,
            prefixicon: prefixicon != null ? Icon(prefixicon) : null,
          ),
        ),
      ],
    );
  }
}
