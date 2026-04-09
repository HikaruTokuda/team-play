class Member {
  Member({
    required this.admin,
    required this.handleName,
    required this.memberId,
    required this.teamId,
    required this.userId
  });

  final String memberId;
  final String userId;
  final String teamId;
  final String handleName;
  final bool admin;

  factory Member.fromJson(dynamic json) {
    return Member(
      admin: json['admin'] as bool, 
      handleName: json['handle_namae'] as String, 
      memberId: json['member_id'] as String, 
      teamId: json['team_id'] as String, 
      userId: json['user_id'] as String
    );
  }
}