import 'package:flutter/material.dart';

class AppliedUserList extends StatefulWidget {
  @override
  _AppliedUserListState createState() => _AppliedUserListState();
}

class chatModel {
  final String name;
  final String message;
  final String time;
  final String avtarurl;

  chatModel({this.name, this.message, this.time, this.avtarurl});
}

List<chatModel> dummyData = [
  chatModel(
      name: "vaidehi shah",
      message: "Good Morning",
      time: "15:30",
      avtarurl: 'images/2.jpg'),
  chatModel(
      name: "jinal shah",
      message: "whats the status",
      time: "10:00",
      avtarurl: 'images/1.jpg'),
  chatModel(
      name: "vijay shah",
      message: "Come Fast",
      time: "5:45",
      avtarurl: "images/1.jpg"),
  chatModel(
      name: "ajay vyas",
      message: "hello there",
      time: "15:10",
      avtarurl: "images/3.jpg"),
];

class _AppliedUserListState extends State<AppliedUserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied User List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => Column(
              children: <Widget>[
               ListTile(
                    leading: CircleAvatar(
                        foregroundColor: Colors.greenAccent,
                        backgroundImage: AssetImage(dummyData[i].avtarurl)),
                    title:  Text(
                      dummyData[i].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 19),
                    ),
                    trailing: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/userInfo');
                        },
                        child: Icon(Icons.arrow_right)),
                  ),
                Divider(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
