import 'package:flutter/material.dart';

class YourJob extends StatefulWidget {
  @override
  _YourJobState createState() => _YourJobState();
}

class _YourJobState extends State<YourJob> {
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
            title: Text("Your Job",style: TextStyle(
              color: Colors.black
            ),),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: GestureDetector(
                onTap: ()  {
                  Navigator.pushNamed(context,'/jobDetail');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                            Text("Application Status : ", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500
                            ),),
                            //Text("${widget.position}"),
                          ],
                        ),
                        SizedBox(height: 10),

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
