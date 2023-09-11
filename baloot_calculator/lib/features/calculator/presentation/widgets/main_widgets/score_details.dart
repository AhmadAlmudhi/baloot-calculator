import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/score_line.dart';
import 'package:flutter/material.dart';

class ScoreDetails extends StatelessWidget {
  const ScoreDetails({
    super.key,
    required this.scoreHistory,
  });

  final List<Map<String, int>> scoreHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Card(
          child: Stack(
            children: [
              const Center(
                child: VerticalDivider(
                  indent: 8,
                  endIndent: 8,
                ),
              ),
              ListView(
                children: [
                  for (Map<String, int> line in scoreHistory)
                    ScoreLine(
                      firstScore: line["first"]!,
                      secondScore: line["second"]!,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
