import 'package:flutter/material.dart';

class chatModel {
  final String name;
  final String message;
  final String time;
  final String avtarurl;

  chatModel({this.name, this.message, this.time, this.avtarurl});
}

List<chatModel> dummyData = [
  chatModel(name: "vaidehi shah",message: "Good Morning",time: "15:30",avtarurl: 'images/2.jpg'),
  chatModel(name: "jinal shah",message: "whats the status",time: "10:00",avtarurl: 'images/1.jpg'),
  chatModel(name: "vijay shah",message: "Come Fast",time: "5:45",avtarurl: "images/1.jpg"),
  chatModel(name: "ajay vyas",message: "hello there",time: "15:10",avtarurl: "images/3.jpg"),

];


class AdminJobUser extends StatefulWidget {
  @override
  _AdminJobUserState createState() => _AdminJobUserState();
}

class _AdminJobUserState extends State<AdminJobUser> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title:  Text(
              "Job Users",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body:Container(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context,i) => Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/adminJobUserChat');
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                          foregroundColor: Colors.greenAccent,
                          backgroundImage: AssetImage(dummyData[i].avtarurl)
                      ),
                      title: Row(
                        mainAxisAlignment : MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(dummyData[i].name,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19
                          ),),
                          Text(dummyData[i].time,style: TextStyle(
                              color: Colors.grey,
                              fontSize:14
                          ),),
                        ],
                      ),
                      subtitle: Container(
                        child: Text(dummyData[i].message ,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                      ),
                    ),
                  ),
                  Divider(height: 10),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
