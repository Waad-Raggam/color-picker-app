import 'package:color_blindness/color_blindness.dart';
import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:color_picker_app/utils/color_blindness_scheme.dart';
import 'package:color_picker_app/utils/color_title.dart';
import 'package:flutter/material.dart';

class ColorDetailScreen extends StatelessWidget {
  final ColorModel selectedColor;

  ColorDetailScreen({required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (appBarContext) {
            return ColorBlindType(typeSelected: selectedColor.typeSelected);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: () {
              return applyColorBlindness(selectedColor);
            }(),
          ),
        ),
      ),
    );
  }
}
