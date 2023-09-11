import 'package:baloot_calculator/features/calculator/data/utils/score_cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreLoadingState()) {
    on<ScoreEvent>((event, emit) async {
      if (event is GetScoreHistoryEvent) {
        final List<Map<String, int>> scoreHistory =
            await ScoreCacheHelper().getScoreHistory();

        emit(ScoreLoadedState(scoreHistory: scoreHistory));
      }
    });
  }
}
