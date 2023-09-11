import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.value, this.fontSize = 40});

  final String value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: Theme.of(context).colorScheme.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
