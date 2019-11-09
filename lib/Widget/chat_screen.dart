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
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Layout'),
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
    );
  }
}
