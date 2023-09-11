part of 'score_bloc.dart';

sealed class ScoreState extends Equatable {
  const ScoreState();

  @override
  List<Object> get props => [];
}

final class ScoreLoadingState extends ScoreState {}

final class ScoreLoadedState extends ScoreState {
  final List<Map<String, int>> scoreHistory;

  const ScoreLoadedState({required this.scoreHistory});

  @override
  List<Object> get props => [scoreHistory];
}

final class ScoreErrorState extends ScoreState {}
