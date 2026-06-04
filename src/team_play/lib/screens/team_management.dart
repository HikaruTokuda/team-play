import 'package:flutter/material.dart';

class TeamManagement extends StatefulWidget{
  const TeamManagement({super.key});
  @override
  State<TeamManagement> createState() => _TeamManagement();
}

class _TeamManagement extends State<TeamManagement> {
  String? isSelectedItem = 'annual';
  String paymentTableColumnString = '年';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("収支確認")
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: 
          Column(
            spacing: 16,
            children: [
              Text(
                "集金確認",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold
                )
              ),
              Row(
                spacing: 16,
                children: [
                  SizedBox(width: 16),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: 'annual',
                        child: Text(
                          '年払い',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'month',
                        child: Text(
                          '月払い',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'event',
                        child: Text(
                          'イベント払い',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      )
                    ], 
                    onChanged: (String? value){
                      setState(() {
                        isSelectedItem = value;
                        // TODO_ログ削除
                        print(isSelectedItem);
                        switch(isSelectedItem){
                          case 'month':
                            paymentTableColumnString = "月";
                            break;
                          case 'annual':
                            paymentTableColumnString = "年";
                            break;                        
                          case 'event':
                            paymentTableColumnString = "イベント";
                            break;                              
                          default:
                            print('想定外のデータが設定されました');
                            break;
                        }
                      });
                    },
                    value: isSelectedItem,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      // minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ), 
                    child: Text(
                      '未払いメンバー確認',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  SizedBox(width: 16),
                  Text(
                    "総収入：xxxxxxx円",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),                    
                  ),
                  Text(
                    "総支出：xxxxxxx円",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),                    
                  ),
                  Text(
                    "余剰：xxxxxxx円",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),                    
                  )
                ],
              ),
              Row(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      // minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ), 
                    child: Text(
                      '明細追加',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      // minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ), 
                    child: Text(
                      '集金登録',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 16,)
                ],
              ),
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          paymentTableColumnString,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '価格',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '詳細',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '2022',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '150000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    // --- ボタンを配置 ---
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                       onPressed: () {},
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.green[900],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12)
                         )
                       ), 
                       child: Text(
                         '詳細',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                         ),
                       ),
                      ),
                    ),                    
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '2023',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '190000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    // --- ボタンを配置 ---
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                       onPressed: () {},
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.green[900],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12)
                         )
                       ), 
                       child: Text(
                         '詳細',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                         ),
                       ),
                      ),
                    ),                    
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '2024',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '1050000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    // --- ボタンを配置 ---
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                       onPressed: () {},
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.green[900],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12)
                         )
                       ), 
                       child: Text(
                         '詳細',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                         ),
                       ),
                      ),
                    ),                    
                  ]),
                ],
              )             
            ],
          )
      ),
    );
  }
}