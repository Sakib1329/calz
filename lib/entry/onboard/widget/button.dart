import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // << add this

class CustomButton2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String? suffixSvg;
  final  double svgwidth;
  final  double svgheight;// << change from IconData? to String? for SVG path

  const CustomButton2({
    super.key,
    this.svgwidth=30,
  this.svgheight=30,
    required this.title,
    this.subtitle = "",
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    this.textColor = Colors.white,
    this.suffixSvg,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasSubtitle = subtitle.isNotEmpty;
    final double buttonHeight = hasSubtitle ? 80 : 60;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(360, buttonHeight),
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
      child: suffixSvg == null
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title and optional subtitle
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
              if (hasSubtitle) ...[
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
            ],
          ),
          const SizedBox(width: 24), // Optional balance
        ],
      )
          : Row(
        children: [
          SvgPicture.asset(
            suffixSvg!,
            width: svgwidth,
            height: svgheight,
            colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: 'Schuyler',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
