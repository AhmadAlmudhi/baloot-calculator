import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/custom_arrow.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/custom_text.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.firstScore,
    required this.secondScore,
    required this.firstController,
    required this.secondController,
  });

  final int firstScore;
  final int secondScore;
  final TextEditingController firstController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Stack(
          children: [
            const CustomArrow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const CustomText(value: 'لهم'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: CustomText(value: '$firstScore'),
                    ),
                    CustomTextField(
                      controller: firstController,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const CustomText(value: 'لنا'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: CustomText(value: '$secondScore'),
                    ),
                    CustomTextField(
                      controller: secondController,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
