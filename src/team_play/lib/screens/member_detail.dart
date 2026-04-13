import 'package:flutter/material.dart';
import 'package:team_play/models/member.dart';

class MemberDetail extends StatefulWidget {
  const MemberDetail(this.currentSelectedMember, {super.key});
  final Member currentSelectedMember;
  @override
  State<MemberDetail> createState() => _MemberDetail();
}

class _MemberDetail extends State<MemberDetail> {
  final List<String> scoreAtBat = [
    "打席", 
    "安打", 
    "二塁打", 
    "三塁打", 
    "本塁打", 
    "打点", 
    "盗塁",
    "四球",
    "死球",
    "犠打",
    "犠飛",
    "打率",
    "OPS"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentSelectedMember.handleName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),  
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 40,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                  child: const Icon(Icons.person), 
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),                  
                      Text(
                        widget.currentSelectedMember.uniformNumber,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.currentSelectedMember.handleName,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),                    
                      Text(
                        widget.currentSelectedMember.position,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              widget.currentSelectedMember.comment,
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              "打撃成績",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ) 
    );
  }
}