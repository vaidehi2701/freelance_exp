import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final List<String> title = <String>['Requirement For Hardware Engineer',
    'Requirement For Softare Engineer', 'Urgent Plumber Required',
   ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration:new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/try.jpg"),
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Home",style: TextStyle(color: Colors.black),),
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/notification');
                    },
                    child: Icon(Icons.notifications,color: Colors.black,))
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){},
                      color: Colors.red,
                      child: Text('Jobs',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 5),
                    RaisedButton(
                      onPressed: (){},
                      color: Colors.red,
                      child: Text('Notification',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Company Name:'),
                                SizedBox(height: 10),
                                Text('Job Title :'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
