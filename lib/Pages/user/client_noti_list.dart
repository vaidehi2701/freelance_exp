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
          decoration:new BoxDecoration(
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
            title: Text("Notifications",style: ToolbarTitle),
          ),
          body:  ListView.builder(
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
                                title: Text('${title[index]}',style: ToolbarTitle,),
                                content: Container(
                                  height: 55,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(' ${details[index]}',style: Title),
                                      SizedBox(height: 10),
                                      Text('Last Date : ${date[index]}' , style: Title)
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
                                        child: Text('Apply',style: Title),
                                      ),
                                      FlatButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('close',style: Title,),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('${title[index]}' , style:TextStyle(
                                      fontFamily: 'SEGOEUI',
                                      fontSize: 17,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600
                                  )),
                                  SizedBox(height: 10),
                                  Text('Last Date : ${date[index]}' , style: Title),
                                ],
                              ),
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
        ),

      ],
    );

  }
}
