import 'package:flutter/material.dart';

class AdminChat extends StatefulWidget {
  @override
  _AdminChatState createState() => _AdminChatState();
}

class _AdminChatState extends State<AdminChat> {

  final List<String> title = <String>['Requirement For Hardware Engineer',
    'Requirement For Softare Engineer', 'Urgent Plumber Required',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
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
                  child: Text('Jobs'),
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text('Notification'),
                )
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
                        child : Text('Job Title :'),
                      ),
                      trailing:GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/adminJobUser');
                          },
                          child: (Icon(Icons.keyboard_arrow_right))),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
