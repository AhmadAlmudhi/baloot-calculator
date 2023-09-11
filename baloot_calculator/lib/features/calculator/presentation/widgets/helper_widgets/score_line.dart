import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ScoreLine extends StatelessWidget {
  const ScoreLine({
    super.key,
    required this.firstScore,
    required this.secondScore,
  });

  final int firstScore;
  final int secondScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 60,
            child: CustomText(
              value: "$firstScore",
              fontSize: 30,
            ),
          ),
          SizedBox(
            width: 60,
            child: CustomText(
              value: "$secondScore",
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
