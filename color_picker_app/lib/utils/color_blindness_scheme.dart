import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';

Color applyColorBlindness(ColorModel color) {
  switch (color.typeSelected) {
    case ColorBlindnessType.protanomaly:
      return colorBlindness(color.value, ColorBlindnessType.protanomaly);
    case ColorBlindnessType.deuteranomaly:
      return colorBlindness(color.value, ColorBlindnessType.deuteranomaly);
    case ColorBlindnessType.tritanomaly:
      return colorBlindness(color.value, ColorBlindnessType.tritanomaly);
    case ColorBlindnessType.protanopia:
      return colorBlindness(color.value, ColorBlindnessType.protanopia);
    case ColorBlindnessType.deuteranopia:
      return colorBlindness(color.value, ColorBlindnessType.deuteranopia);
    case ColorBlindnessType.tritanopia:
      return colorBlindness(color.value, ColorBlindnessType.tritanopia);
    case ColorBlindnessType.achromatopsia:
      return colorBlindness(color.value, ColorBlindnessType.achromatopsia);
    case ColorBlindnessType.achromatomaly:
      return colorBlindness(color.value, ColorBlindnessType.achromatomaly);

    case ColorBlindnessType.none:
    default:
      return Color(color.value.value);
  }
}
