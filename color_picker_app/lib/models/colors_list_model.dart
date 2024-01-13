import 'package:color_blindness/color_blindness.dart';
import 'package:flutter/material.dart';

class ColorModel {
  final String name;
  final String hexCode;
  final Color value;
  final bool isBlindMode;
  final ColorBlindnessType typeSelected;

  ColorModel(
      {required this.name,
      required this.hexCode,
      required this.value,
      required this.isBlindMode,
      required this.typeSelected});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
        name: json['name'] ?? '',
        hexCode: json['hex'] ?? '',
        value: json['value'],
        isBlindMode: json['isBlindMode'],
        typeSelected: ColorBlindnessType.values[int.parse(json['selected'])]);
  }

  // Convert color to colorblind-friendly version
  ColorModel toColorblind(ColorBlindnessType typeSelected) {
    return ColorModel(
      name: name,
      hexCode: hexCode,
      value: value,
      isBlindMode: true,
      typeSelected: typeSelected,
    );
  }
}
