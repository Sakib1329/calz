import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double value; // Values: 0, 1, or 2
  final ValueChanged<double> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;

  const CustomProgressBar({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = AppColors.darkGreen,
    this.inactiveColor = AppColors.neutralLight2,
    this.thumbColor = AppColors.darkGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 16,
          thumbColor: thumbColor,
          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColor,
          overlayColor: AppColors.transparent,
          thumbShape: const _CustomThumbShape(),
          trackShape: const _CustomTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
          // Add tick marks for the three values
          activeTickMarkColor: activeColor,
          inactiveTickMarkColor: inactiveColor,
        ),
        child: Slider(
          value: value,
          min: 0,
          max: 2,
          divisions: 2, // Creates 3 discrete steps (0, 1, 2)
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// Custom thumb shape with a circle and pointer
class _CustomThumbShape extends SliderComponentShape {
  const _CustomThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 40);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Draw outer circle
    final Paint outerCirclePaint = Paint()
      ..color = AppColors.neutralGrayDark
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 12, outerCirclePaint);

    // Draw inner circle
    final Paint innerCirclePaint = Paint()
      ..color = sliderTheme.thumbColor ?? AppColors.darkGreen
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 8, innerCirclePaint);

    // Draw pointer
    final Paint pointerPaint = Paint()
      ..color = sliderTheme.thumbColor ?? AppColors.darkGreen
      ..style = PaintingStyle.fill;

    final Path pointerPath = Path()
      ..moveTo(center.dx, center.dy + 12)
      ..lineTo(center.dx - 10, center.dy + 30)
      ..lineTo(center.dx + 10, center.dy + 30)
      ..close();

    canvas.drawPath(pointerPath, pointerPaint);
  }
}

// Custom track shape
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  const _CustomTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 16;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}