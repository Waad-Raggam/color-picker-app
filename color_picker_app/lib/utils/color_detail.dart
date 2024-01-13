import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';

class ColorDetail extends StatelessWidget {
  const ColorDetail({
    super.key,
    required this.typeSelected,
    required this.color,
  });

  final ColorBlindnessType typeSelected;
  final ColorModel color;

  @override
  Widget build(BuildContext context) {
    String title;
    switch (typeSelected) {
      case ColorBlindnessType.none:
        title = '${color.name} (Normal)';
        break;
      case ColorBlindnessType.protanomaly:
        title = '${color.name} (Protanomaly)';
        break;
      case ColorBlindnessType.deuteranomaly:
        title = '${color.name} (Deuteranomaly)';
        break;
      case ColorBlindnessType.tritanomaly:
        title = '${color.name} (Tritanomaly)';
        break;
      case ColorBlindnessType.protanopia:
        title = '${color.name} (Protanopia)';
        break;
      case ColorBlindnessType.deuteranopia:
        title = '${color.name} (Deuteranopia)';
        break;
      case ColorBlindnessType.tritanopia:
        title = '${color.name} (Tritanopia)';
        break;
      case ColorBlindnessType.achromatopsia:
        title = '${color.name} (Achromatopsia)';
        break;
      case ColorBlindnessType.achromatomaly:
        title = '${color.name} (Achromatomaly)';
        break;

      default:
        title = '${color.name}';
    }
    return Text(title);
  }
}
