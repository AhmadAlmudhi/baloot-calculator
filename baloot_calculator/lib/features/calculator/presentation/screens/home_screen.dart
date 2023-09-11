import 'package:baloot_calculator/features/calculator/bloc/score_bloc.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/main_widgets/buttons.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/main_widgets/score.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/main_widgets/score_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (context, state) {
        if (state is ScoreLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ScoreLoadedState) {
          int firstScore = 0;
          int secondScore = 0;
          TextEditingController firstController = TextEditingController();
          TextEditingController secondController = TextEditingController();

          for (Map<String, int> scoreLine in state.scoreHistory) {
            firstScore += scoreLine["first"]!;
            secondScore += scoreLine["second"]!;
          }

          bool gameStarted = !(firstScore == 0 && secondScore == 0);

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Score(
                      firstScore: firstScore,
                      secondScore: secondScore,
                      firstController: firstController,
                      secondController: secondController,
                    ),
                    Buttons(
                      firstController: firstController,
                      secondController: secondController,
                      gameStarted: gameStarted,
                    ),
                    ScoreDetails(
                      scoreHistory: state.scoreHistory,
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
