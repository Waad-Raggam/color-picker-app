import 'package:color_blindness/color_blindness.dart';
import 'package:color_blindness/color_blindness_color_scheme.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final ColorModel color;

  ColorCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: colorBlindnessColorScheme(
          ColorScheme.dark(),
          color.typeSelected,
        ),
      ),
      child: Card(
        color: () {
          switch (color.typeSelected) {
            case ColorBlindnessType.protanomaly:
              return colorBlindness(
                  color.value, ColorBlindnessType.protanomaly);
            case ColorBlindnessType.deuteranomaly:
              return colorBlindness(
                  color.value, ColorBlindnessType.deuteranomaly);
            case ColorBlindnessType.tritanomaly:
              return colorBlindness(
                  color.value, ColorBlindnessType.tritanomaly);
            case ColorBlindnessType.protanopia:
              return colorBlindness(color.value, ColorBlindnessType.protanopia);
            case ColorBlindnessType.deuteranopia:
              return colorBlindness(
                  color.value, ColorBlindnessType.deuteranopia);
            case ColorBlindnessType.tritanopia:
              return colorBlindness(color.value, ColorBlindnessType.tritanopia);
            case ColorBlindnessType.achromatopsia:
              return colorBlindness(
                  color.value, ColorBlindnessType.achromatopsia);
            case ColorBlindnessType.achromatomaly:
              return colorBlindness(
                  color.value, ColorBlindnessType.achromatomaly);

            case ColorBlindnessType.none:
            default:
              return Color(color.value.value);
          }
        }(),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Text(
            color.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
