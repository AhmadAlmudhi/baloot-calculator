import 'package:flutter/material.dart';

class DrawTextField extends StatefulWidget {
  const DrawTextField({super.key, required this.onSubmitted});

  final Function(String value) onSubmitted;

  @override
  State<DrawTextField> createState() => _DrawTextFieldState();
}

class _DrawTextFieldState extends State<DrawTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25),
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onEditingComplete: () {
            widget.onSubmitted.call(controller.text);
            controller.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
