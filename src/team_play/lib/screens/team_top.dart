import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:team_play/models/event.dart';
import 'package:team_play/models/score.dart';
import 'package:team_play/models/team.dart';
import 'package:flutter/services.dart' show rootBundle;

class TeamTop extends StatefulWidget {
  const TeamTop({super.key});

  @override
  State<TeamTop> createState() => _TeamTop();
}

class _TeamTop extends State<TeamTop> {
  @override
  void initState() {
    super.initState();
    getEvents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team A'),
      ),
      body: Container(),
    );
  }

  Future<List<Event>> getEvents() async {
    String loadData = await rootBundle.loadString('dummy/events.json');
    final List<dynamic> rawData = jsonDecode(loadData);
    List<Map<String, String>> eventList = rawData.map((item) {
      return (item as Map<String, dynamic>).map((key, value){
        return MapEntry(key, value.toString());
      });
    }).toList();
    List<Event> events = eventList.map((i) => new Event.fromJson(i)).toList();
    events.forEach((event) => print('eventName: ${event.eventName} eventDate: ${event.eventDate}'));
    return events;
  }
}