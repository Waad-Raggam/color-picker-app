import 'package:color_blindness/color_blindness.dart';
import 'package:flutter/material.dart';

class ColorModel {
  final String name;
  final String hexCode;
  final Color value;
  final bool isBlindMode;
  final ColorBlindnessType typeSelected;

  // Add this variable to track whether to show the hex value or not
  final bool showHexValue;

  ColorModel({
    required this.name,
    required this.hexCode,
    required this.value,
    required this.isBlindMode,
    required this.typeSelected,
    this.showHexValue = false, // Default value for showHexValue
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      name: json['name'] ?? '',
      hexCode: json['hex'] ?? '',
      value: json['value'],
      isBlindMode: json['isBlindMode'],
      typeSelected: ColorBlindnessType.values[int.parse(json['selected'])],
    );
  }

  // Convert color to colorblind-friendly version
  ColorModel toColorblind(ColorBlindnessType typeSelected) {
    return ColorModel(
      name: name,
      hexCode: hexCode,
      value: value,
      isBlindMode: true,
      typeSelected: typeSelected,
      showHexValue: showHexValue, // Pass the showHexValue to the new instance
    );
  }

  // Add the copyWith method
  ColorModel copyWith({bool? showHexValue}) {
    return ColorModel(
      name: name,
      hexCode: hexCode,
      value: value,
      isBlindMode: isBlindMode,
      typeSelected: typeSelected,
      showHexValue: showHexValue ?? this.showHexValue,
    );
  }
}
