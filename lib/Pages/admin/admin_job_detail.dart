import 'package:flutter/material.dart';

class AdminJobDetail extends StatefulWidget {

  @override
  _AdminJobDetailState createState() => _AdminJobDetailState();
}

class _AdminJobDetailState extends State<AdminJobDetail> {
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
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title:  Text(
              "Job Details",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 10),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, -8),
                        blurRadius: 10,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.home),
                          SizedBox(width: 10),
                          Text('Job Title 1',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.home),
                          SizedBox(width: 10),
                          Text('Job Title 2',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.date_range),
                          SizedBox(width: 10),
                          Text('Start Date',
                            style: TextStyle(
                              fontSize: 17,),),
                          SizedBox(width: 40),
                          Icon(Icons.date_range),
                          SizedBox(width: 10),
                          Text('End Date',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.date_range),
                          SizedBox(width: 10),
                          Text('Working Days In Week',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.date_range),
                          SizedBox(width: 10),
                          Text('Hour Of Week',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.event_available),
                          SizedBox(width: 10),
                          Text('Sunday Working Avaiblity',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.payment),
                          SizedBox(width: 10),
                          Text('Payment Terms',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_city),
                          SizedBox(width: 10),
                          Text('Job Location',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.hotel),
                          SizedBox(width: 10),
                          Text('Accommodation Avaiblity',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.directions_car),
                          SizedBox(width: 10),
                          Text('One Time Trasportation',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.directions_bus),
                          SizedBox(width: 10),
                          Text('Local Transportation',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          SizedBox(width: 10),
                          Text('Regular Working Hour Day Rate',
                            style: TextStyle(
                              fontSize: 17,),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text('OverTime Working Hour Rate Per Hour',
                              style: TextStyle(
                                fontSize: 17,
                              ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: RaisedButton(
                            color: Colors.red,
                            onPressed: (){
                              Navigator.pushNamed(context, '/appliedUserList');
                            },
                            child: Text('Applied User',style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),),
                          )
                      ),
                      SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: RaisedButton(
                              color: Colors.red,
                              onPressed: (){
                                Navigator.pushNamed(context, '/adminJobUser');
                              },
                              child: Text('Inbox',style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                              )
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
