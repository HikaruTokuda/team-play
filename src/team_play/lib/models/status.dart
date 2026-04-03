class Status {
  Status({
    required this.statusId,
    required this.eventId,
    required this.memberId,
    required this.attendingFlag,
    required this.eventTypeFlag
  });

  final String statusId;
  final String eventId;
  final String memberId;
  final bool attendingFlag;
  final bool eventTypeFlag;

  factory Status.fromJson(dynamic json) {
    return Status(
      statusId: json['status_id'] as String, 
      eventId: json['event_id'] as String, 
      memberId: json['memberId'] as String, 
      attendingFlag: json['attendingFlag'] as bool, 
      eventTypeFlag: json['eventTypeFlag'] as bool
    );
  }
}