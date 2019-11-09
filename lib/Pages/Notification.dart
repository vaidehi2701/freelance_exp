import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {


  final List<String> title = <String>['Requirement For Hardware Engineer',
    'Requirement For Softare Engineer', 'Urgent Plumber Required',
    'Requirement For Hardware Engineer', 'Requirement For Hardware Engineer',
    'Requirement For Hardware Engineer'];
  final List<String> details = <String>['job1 Details is here ',
    'Details U Require', 'What U ELSE wANT','Bio data Of Job',
    'Sample Text Sample Text', 'Sample Text Sample Text Sample Text'];
  final List<String> date = <String>['25-10-19', '15-10-19', '29-12-19','25-10-19', '15-10-19', '29-12-19'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
     body:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: title.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder:(BuildContext context){
                        return AlertDialog(
                          title: Text('${title[index]}'),
                          content: Container(
                            height: 55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(' ${details[index]}'),
                                SizedBox(height: 10),
                                Text('Last Date : ${date[index]}' , style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/Home');
                                  },
                                  child: Text('Apply'),
                                ),
                                FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('close'),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                  );},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('${title[index]}' , style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                            ),),
                            SizedBox(height: 10),
                            Text('Last Date : ${date[index]}' , style: TextStyle(
                              fontSize: 15
                            ),),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)

                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );

  }
}
