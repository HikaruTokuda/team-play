import 'package:flutter/material.dart';
import 'package:team_play/models/member.dart';
import 'package:team_play/models/team.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class MemberList extends StatefulWidget{
  const MemberList(this.teamId, {super.key});
  final String teamId;
  @override
  State<MemberList> createState() => _MemberList();
}

class _MemberList extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メンバー一覧')
      ),
      body: FutureBuilder<List<Member>>(
        future: getMember(), 
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
            return const Center(child: Text('メンバーがありません'));
          }

          final members = snapshot.data!;
          return ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              return Container(
                height: 160,
                margin: const EdgeInsets.only(bottom: 4), // 見やすく追加
                child: InkWell(
                  onTap: () {
                    // メンバ詳細画面へ
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(builder: (context) => EventDetail(members[index]))
                    // );
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        spacing: 20,
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                            // onForegroundImageError: (e, s) => print("Image Load Error"),
                            child: const Icon(Icons.person), 
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      members[index].uniformNumber,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      members[index].handleName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  members[index].position,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "率 .280  本 0  点 10",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ) 
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Member>> getMember() async {
  // 1. JSONファイルを読み込む
  String loadData = await rootBundle.loadString('dummy/member.json');
  
  // 2. jsonDecode する (List<dynamic> が返る)
  final List<dynamic> rawData = jsonDecode(loadData);
  
  // 3. 余計な Map 変換をせず、そのまま Member クラスに変換する
  // これにより admin は bool のまま Member.fromJson に渡されます
  List<Member> members = rawData.map((item) => Member.fromJson(item)).toList();
  
  return members;
}
}