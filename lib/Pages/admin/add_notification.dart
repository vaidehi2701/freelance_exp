import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notification'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Enter Notification Title',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
            TextField(style: TextStyle(
              fontSize: 15
            ),
            ),
            SizedBox(height: 20),
            Text('Enter Notification Details',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            TextField(style: TextStyle(
                fontSize: 15
            ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            SizedBox(height: 20),
           Center(
             child: Container(
                  child: RaisedButton(
                    onPressed: () {
                     Navigator.of(context).pop();
                    },
                    padding: const EdgeInsets.all(0.0),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    //color: Colors.cyan[100],
                    elevation: 0,
                    child:Container(
                      width: 180,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text('Add Notification' ,
                          textAlign: TextAlign.center, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ),
                ),
           ),

          ],
        ),
      ),
    );
  }
}
