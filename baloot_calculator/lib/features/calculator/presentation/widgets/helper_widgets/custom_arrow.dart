import 'package:flutter/material.dart';

class CustomArrow extends StatefulWidget {
  const CustomArrow({
    super.key,
  });

  @override
  State<CustomArrow> createState() => _CustomArrowState();
}

class _CustomArrowState extends State<CustomArrow> {
  List<IconData> icons = [
    Icons.arrow_circle_right_outlined,
    Icons.arrow_circle_up_outlined,
    Icons.arrow_circle_left_outlined,
    Icons.arrow_circle_down_outlined,
  ];
  int currentIconIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              if (currentIconIndex < 3) {
                currentIconIndex++;
              } else {
                currentIconIndex = 0;
              }
            });
          },
          child: Icon(
            icons[currentIconIndex],
            size: 60,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
