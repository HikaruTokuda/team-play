class Score {
  Score({
    required this.gameId,
    required this.eventId,
    required this.innings,
    required this.batFirst,
    required this.score,
  });

  final String gameId;
  final String eventId;
  final int innings;
  final bool batFirst;
  final List<List<int>> score;

  factory Score.fromJson(dynamic json) {
    return Score(
      gameId: json['game_id'] as String, 
      eventId: json['event_id'] as String, 
      innings: json['innings'] as int, 
      batFirst: json['bat_first'], 
      score: List<List<int>>.from(json['score'])
    );
  }
}