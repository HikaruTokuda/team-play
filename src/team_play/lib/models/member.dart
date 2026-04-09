class Member {
  Member({
    required this.admin,
    required this.handleName,
    required this.memberId,
    required this.teamId,
    required this.userId,
    required this.uniformNumber,
    required this.position
  });

  final String memberId;
  final String userId;
  final String teamId;
  final String handleName;
  final bool admin;
  final String uniformNumber;
  final String position;

  factory Member.fromJson(dynamic json) {
    return Member(
      admin: json['admin'] as bool, 
      handleName: json['handle_namae'] as String, 
      memberId: json['member_id'] as String, 
      teamId: json['team_id'] as String, 
      userId: json['user_id'] as String,
      uniformNumber: json['uniform_number'] as String,
      position: json['position'] as String
    );
  }
}