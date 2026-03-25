class Event {
  Event({
    required this.eventId,
    required this.eventName,
    required this.teamId,
    required this.eventDate,
    required this.venue,
    required this.fee,
  });

  final String eventId;
  final String eventName;
  final String teamId;
  final DateTime eventDate;
  final String venue;
  String? MVP;
  final int fee;

  factory Event.fromJson(dynamic json) {
    return Event(
      eventId: json['event_id'] as String, 
      eventName: json['event_name'] as String, 
      teamId: json['team_id'] as String, 
      eventDate: DateTime.parse(json['event_date'] as String), 
      venue: json['venue'] as String, 
      fee: int.parse(json['fee'] as String)
    );
  }
}