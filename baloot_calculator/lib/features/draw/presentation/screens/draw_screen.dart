import 'package:baloot_calculator/features/draw/presentation/widgets/draw_text_field.dart';
import 'package:baloot_calculator/features/draw/presentation/widgets/show_custom_dialog.dart';
import 'package:flutter/material.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({super.key});

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("دق ولد"),
        actions: [
          IconButton(
            onPressed: () => showCustomDialog(context: context, names: names),
            icon: const Icon(
              Icons.casino_outlined,
              size: 35,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: DrawTextField(
            onSubmitted: (String value) {
              setState(() {
                if (value.trim() != "") {
                  names.add(value);
                }
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (String name in names)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 32, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              names.remove(name);
                            });
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.redAccent,
                            size: 35,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
