import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final IconData? suffixIcon;

  const CustomButton2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    this.textColor = Colors.white,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(360, 80),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor),
        ),
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shadowColor: AppColors.lightGray,
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontFamily: 'Schuyler',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Trajan Pro',
                ),
              ),
            ],
          ),

          // Suffix icon
          if (suffixIcon != null)
            Icon(
              suffixIcon,
              color: textColor,
              size: 24,
            ),
        ],
      ),
    );
  }
}
