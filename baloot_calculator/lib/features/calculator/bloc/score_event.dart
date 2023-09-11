part of 'score_bloc.dart';

sealed class ScoreEvent extends Equatable {
  const ScoreEvent();

  @override
  List<Object> get props => [];
}

class GetScoreHistoryEvent extends ScoreEvent {}
