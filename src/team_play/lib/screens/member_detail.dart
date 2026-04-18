import 'dart:math';
import 'package:flutter/material.dart';
// ※Memberモデルのパスは適宜プロジェクトに合わせてください
// import 'package:team_play/models/member.dart'; 

class MemberDetail extends StatefulWidget {
  const MemberDetail(this.currentSelectedMember, {super.key});
  final dynamic currentSelectedMember; // 型は Member に戻してください
  @override
  State<MemberDetail> createState() => _MemberDetail();
}

class _MemberDetail extends State<MemberDetail> {
  late Future<(List<DataColumn>, List<DataRow>)> _scoreFuture;

  final List<String> scoreAtBat = [
    "試合", "打率", "打席", "安打", "二塁打", "三塁打", "本塁打", 
    "打点", "盗塁", "四球", "死球", "犠打", "犠飛", "出塁率", "OPS"
  ];

  @override
  void initState() {
    super.initState();
    _scoreFuture = createScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentSelectedMember.handleName),
      ),
      // 全体をスクロール可能にする
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // プロフィールヘッダー
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 40,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage('https://picsum.photos'),
                    child: Icon(Icons.person),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          widget.currentSelectedMember.uniformNumber,
                          style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.currentSelectedMember.handleName,
                          style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.currentSelectedMember.position,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // コメントセクション
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                widget.currentSelectedMember.comment,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            // 打撃成績セクション
            _buildSectionTitle("打撃成績"),
            FutureBuilder(
              future: _scoreFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('エラー: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text('データがありません'));
                }
                final score = snapshot.data!;
                // ExpandedやListViewを使わず、横スクロールのみを配置
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DataTable(
                    columns: score.$1,
                    rows: score.$2,
                    columnSpacing: 20,
                    headingRowHeight: 40,
                    dataRowMinHeight: 40,
                  ),
                );
              },
            ),
            const SizedBox(height: 30), // ここで投手成績との間隔を調整
            // 投手成績セクション
            _buildSectionTitle("投手成績"),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 40), // 下部に少し余白
              child: Text("（投手成績の表をここに実装）", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  // セクションタイトル用共通ウィジェット
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Future<(List<DataColumn>, List<DataRow>)> createScore() async {
    final labels = List<DataColumn>.generate(
      scoreAtBat.length,
      (index) => DataColumn(
        label: Text(scoreAtBat[index], style: const TextStyle(color: Colors.black)),
      ),
      growable: false,
    );

    List<String> score = [];
    for (var label in scoreAtBat) {
      if (label == "打率" || label == "OPS" || label == "出塁率") {
        String doubleVal = Random().nextDouble().toStringAsFixed(3);
        score.add(doubleVal.substring(doubleVal.indexOf('.')));
      } else {
        score.add(Random().nextInt(200).toString());
      }
    }

    final values = [
      DataRow(
        cells: List<DataCell>.generate(
          score.length,
          (index) => DataCell(
            Text(score[index], style: const TextStyle(color: Colors.black)),
          ),
        ),
      )
    ];

    return (labels, values);
  }
}