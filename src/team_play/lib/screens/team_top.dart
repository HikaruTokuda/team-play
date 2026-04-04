import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:team_play/models/event.dart';
import 'package:team_play/models/score.dart';
import 'package:team_play/models/team.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:team_play/screens/event_detail.dart';

class TeamTop extends StatefulWidget {
  const TeamTop({super.key});

  @override
  State<TeamTop> createState() => _TeamTop();
}

class _TeamTop extends State<TeamTop>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team A')
      ),
      body: FutureBuilder<List<Event>>(
        future: getEvents(), // 非同期処理を指定
        builder: (context, snapshot) {
          // 読み込み中
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // エラー時
          if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          }
          // データが空の場合
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('イベントがありません'));
          }

          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Container(
                height: 180,
                margin: const EdgeInsets.only(bottom: 4), // 見やすく追加
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => EventDetail(events[index]))
                    );
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('yyyy年MM月dd日').format(events[index].eventDate),
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            events[index].eventName,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black
                            ),
                          ),
                          Row(
                            spacing: 24.0,
                            children: [
                              Text(
                                events[index].venue,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                DateFormat('HH:mm').format(events[index].eventDate),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ) 
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(        
        child: Icon(Icons.add),
        onPressed: () {}
      ),
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
    // events.forEach((event) => print('eventName: ${event.eventName} eventDate: ${event.eventDate}'));
    return events;
  }
}