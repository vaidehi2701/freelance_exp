import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {

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
              title:  Text('Add Notification',style: ToolbarTitle),
            ),
            body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Enter Notification Title',style: TextStyle(
                        fontFamily: 'SEGOEUI',
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                    TextField(style: Title
                    ),
                    SizedBox(height: 20),
                    Text('Enter Notification Details',style: TextStyle(
                        fontFamily: 'SEGOEUI',
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),),
                    TextField(style: Title,
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
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text('Add Notification' ,
                                textAlign: TextAlign.center, style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.8,
                                    fontSize: 18,
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

        ),

      ],
    );
  }
}
