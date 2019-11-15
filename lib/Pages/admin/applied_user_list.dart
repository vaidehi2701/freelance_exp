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
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/app_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title:Text('Applied User List',style: TextStyle(
                color: Colors.white
            ),),
          ),
          body:Padding(
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
        ),

      ],
    );
  }
}
