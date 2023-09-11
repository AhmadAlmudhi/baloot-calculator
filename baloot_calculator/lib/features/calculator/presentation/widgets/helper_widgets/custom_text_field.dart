import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextField(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25),
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
