import 'package:colors_app/models/colors_list_model.dart';
import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final ColorModel color;

  ColorCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(color.value),
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
    );
  }
}
