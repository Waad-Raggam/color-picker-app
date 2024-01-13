import 'package:color_blindness/color_blindness.dart';
import 'package:flutter/material.dart';

class ColorBlindType extends StatelessWidget {
  const ColorBlindType({
    super.key,
    required this.typeSelected,
  });

  final ColorBlindnessType typeSelected;

  @override
  Widget build(BuildContext context) {
    String title;
    switch (typeSelected) {
      case ColorBlindnessType.none:
        title = 'Colors List (Normal)';
        break;
      case ColorBlindnessType.protanomaly:
        title = 'Colors List (Protanomaly)';
        break;
      case ColorBlindnessType.deuteranomaly:
        title = 'Colors List (Deuteranomaly)';
        break;
      case ColorBlindnessType.tritanomaly:
        title = 'Colors List (Tritanomaly)';
        break;
      case ColorBlindnessType.protanopia:
        title = 'Colors List (Protanopia)';
        break;
      case ColorBlindnessType.deuteranopia:
        title = 'Colors List (Deuteranopia)';
        break;
      case ColorBlindnessType.tritanopia:
        title = 'Colors List (Tritanopia)';
        break;
      case ColorBlindnessType.achromatopsia:
        title = 'Colors List (Achromatopsia)';
        break;
      case ColorBlindnessType.achromatomaly:
        title = 'Colors List (Achromatomaly)';
        break;

      default:
        title = 'Colors List';
    }
    return Text(title);
  }
}
