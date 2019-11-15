import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<String> title = <String>['Requirement For Hardware Engineer',
    'Requirement For Softare Engineer', 'Urgent Plumber Required',
  ];

  TextStyle ToolbarTitle = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.black
  );

  TextStyle Title = TextStyle(
      fontFamily: 'SEGOEUI',
      fontSize: 16,
      fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/option4.jpg"),
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
            title:Text('Chat',style: ToolbarTitle),
          ),
          body:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){},
                      color: Colors.red,
                      child: Text('Jobs',style: TextStyle(
                          fontFamily: 'SEGOEUI',
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),),
                    ),
                    SizedBox(width: 2),
                    RaisedButton(
                      onPressed: (){},
                      color: Colors.red,
                      child: Text('Notification',style: TextStyle(
                          fontFamily: 'SEGOEUI',
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child : Text('Job Title :',style: Title),
                            ),
                            trailing:GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context,'/adminJobUser');
                                },
                                child: (Icon(Icons.keyboard_arrow_right))),
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
