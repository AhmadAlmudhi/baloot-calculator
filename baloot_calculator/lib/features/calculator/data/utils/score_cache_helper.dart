import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreCacheHelper {
  Future<List<Map<String, int>>> getScoreHistory() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final List<String>? score = sharedPreferences.getStringList("SCORE");

    final List<Map<String, dynamic>> stringScoreHistory = score
            ?.map((scoreLine) => jsonDecode(scoreLine) as Map<String, dynamic>)
            .toList() ??
        [];

    List<Map<String, int>> intScoreHistory = stringScoreHistory
        .map((scoreLine) => {
              "first": int.parse(scoreLine["first"].toString()),
              "second": int.parse(scoreLine["second"].toString())
            })
        .toList();

    return intScoreHistory;
  }

  Future<void> _updateScoreHistory(List<Map<String, int>> scoreHistory) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final List<String> updatedScore =
        scoreHistory.map((scoreLine) => jsonEncode(scoreLine)).toList();

    sharedPreferences.setStringList("SCORE", updatedScore);
  }

  Future<void> updateScore(Map<String, int> scoreLine) async {
    List<Map<String, int>> scoreHistory = await getScoreHistory();
    scoreHistory.add(scoreLine);
    _updateScoreHistory(scoreHistory);
  }

  Future<void> undoUpdating() async {
    List<Map<String, int>> scoreHistory = await getScoreHistory();
    if (scoreHistory.isNotEmpty) {
      scoreHistory.removeLast();
      _updateScoreHistory(scoreHistory);
    }
  }

  Future<void> startNewGame() async {
    List<Map<String, int>> scoreHistory = await getScoreHistory();
    scoreHistory.clear();
    _updateScoreHistory(scoreHistory);
  }
}
