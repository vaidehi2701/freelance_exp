import 'package:flutter/material.dart';

class AdminJobList extends StatefulWidget {
  @override
  _AdminJobListState createState() => _AdminJobListState();
}

class _AdminJobListState extends State<AdminJobList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Home"),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,'/addJobDetail');
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
      body:  Padding(
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
                      color: Colors.lightBlue,
                      onPressed: (){
                        Navigator.pushNamed(context,'/adminJobDetail');
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
    );
  }
}
