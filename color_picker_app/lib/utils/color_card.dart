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
        color: color.isBlindMode
            ? colorBlindness(color.value, ColorBlindnessType.achromatomaly)
            : Color(color.value.value),
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
