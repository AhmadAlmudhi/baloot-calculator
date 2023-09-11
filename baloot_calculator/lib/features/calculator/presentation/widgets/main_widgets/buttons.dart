import 'package:baloot_calculator/features/calculator/bloc/score_bloc.dart';
import 'package:baloot_calculator/features/calculator/presentation/widgets/helper_widgets/custom_button.dart';
import 'package:baloot_calculator/features/calculator/data/utils/score_cache_helper.dart';
import 'package:baloot_calculator/features/draw/presentation/screens/draw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.firstController,
    required this.secondController,
    required this.gameStarted,
  });

  final TextEditingController firstController;
  final TextEditingController secondController;
  final bool gameStarted;

  @override
  Widget build(BuildContext context) {
    goToDrawScreen() {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const DrawScreen(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            value: 'صكة جديدة',
            onPressed: () {
              ScoreCacheHelper().startNewGame();
              BlocProvider.of<ScoreBloc>(context).add(GetScoreHistoryEvent());
            },
          ),
          CustomButton(
            value: 'سجِّل',
            onPressed: () {
              int first = 0;
              int second = 0;
              if (firstController.text.isNotEmpty) {
                first = int.parse(firstController.text);
              }
              if (secondController.text.isNotEmpty) {
                second = int.parse(secondController.text);
              }
              if (first == 0 && second == 0) {
                return;
              }
              ScoreCacheHelper()
                  .updateScore({"first": first, "second": second});
              BlocProvider.of<ScoreBloc>(context).add(GetScoreHistoryEvent());
            },
          ),
          InkWell(
            onLongPress: () {
              goToDrawScreen();
            },
            child: CustomButton(
              value: gameStarted ? 'تراجع' : "دق ولد",
              onPressed: () {
                if (gameStarted) {
                  ScoreCacheHelper().undoUpdating();
                  BlocProvider.of<ScoreBloc>(context)
                      .add(GetScoreHistoryEvent());
                } else {
                  goToDrawScreen();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
