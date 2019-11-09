import 'package:flutter/material.dart';

class YourJob extends StatefulWidget {
  @override
  _YourJobState createState() => _YourJobState();
}

class _YourJobState extends State<YourJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Job"),
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
    );
  }
}
