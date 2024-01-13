import 'package:color_picker_app/models/colors_list_model.dart';
import 'package:color_picker_app/utils/color_blindness_scheme.dart';
import 'package:color_picker_app/utils/color_detail.dart';
import 'package:flutter/material.dart';

class ColorDetailScreen extends StatelessWidget {
  final ColorModel selectedColor;

  ColorDetailScreen({required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF393441),
        title: Builder(
          builder: (appBarContext) {
            return ColorDetail(
              typeSelected: selectedColor.typeSelected,
              color: selectedColor,
            );
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
