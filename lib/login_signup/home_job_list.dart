import 'package:flutter/material.dart';

class HomeJobList extends StatefulWidget {
  @override
  _HomeJobListState createState() => _HomeJobListState();
}

class _HomeJobListState extends State<HomeJobList> {
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
                      Navigator.pushNamed(context, '/notification');
                    },
                    child: Icon(Icons.notifications,color: Colors.black,))
              ],
            ),
          ),
          body:  Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Container(
                  height: 155,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: <Widget>[
                            Text("Company Name : ", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500
                            ),),
                            // Text("${widget.company}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("Job Title : ", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                            //Text("${widget.start}"),
                          ],
                        ),
                        SizedBox(height:10),
                        Row(
                          children: <Widget>[
                            Text("Salary : ", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500
                            ),),
                            //Text("${widget.position}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            color: Colors.red,

                            onPressed: (){
                              Navigator.pushNamed(context,'/jobDetail');
                            },
                            child: Text('More Info',style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        )
                      ],
                    ),
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
