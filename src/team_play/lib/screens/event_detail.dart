import 'package:flutter/material.dart';
import 'package:team_play/models/event.dart';
import 'package:intl/intl.dart';

class EventDetail extends StatefulWidget {
  const EventDetail(this.currentEvent, {super.key});
  final Event currentEvent;
  @override
  State<EventDetail> createState() => _EventDetail();
}

class _EventDetail extends State<EventDetail> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next page')
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.currentEvent.eventName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.date_range),
                Text(
                  DateFormat('yyyy年MM月dd日').format(widget.currentEvent.eventDate),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.timelapse_sharp),
                Text(
                  DateFormat('HH:mm').format(widget.currentEvent.eventDate),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.place),
                Text(
                  widget.currentEvent.venue,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            TextField(
              controller: TextEditingController(text: '時間厳守で来てください。\nわかったか。'),
              readOnly: true,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[400],
              ),
              style: TextStyle(
                color: Colors.black
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.check_circle),
                Text(
                  '参加者１、参加者２、参加者３',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.cancel),
                Text(
                  '不参加者１、不参加者２、不参加者３',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ), 
                  child: Text(
                    '出席',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ), 
                  child: Text(
                    '欠席',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 4),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ), 
                child: Text(
                  '支払確認',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            )            
          ],
        ),
      ) 
    );
  }
}