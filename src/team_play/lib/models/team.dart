class Team {
  Team({
    required this.teamId,
    required this.teamName
  });
  final String teamId;
  final String teamName;

  factory Team.fromJson(dynamic json) {
    return Team(
      teamId: json['team_id'], 
      teamName: json['team_name']
    );
  }
}