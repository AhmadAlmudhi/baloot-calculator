import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  final String value;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: onPressed,
        child: Text(
          value,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
