import 'package:flutter/material.dart';

class AdminJobList extends StatefulWidget {
  @override
  _AdminJobListState createState() => _AdminJobListState();
}

class _AdminJobListState extends State<AdminJobList> {

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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Job List",
                  style: ToolbarTitle
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/addJobDetail');
                    },
                    child: Icon(Icons.add))
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Container(
                height: 175,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Company Name : ",
                              style: Title
                            ),
                          ),
                          // Text("${widget.company}"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Job Title : ",
                              style:Title
                            ),
                          ),
                          //Text("${widget.start}"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Salary : ",
                              style: Title
                            ),
                          ),
                          //Text("${widget.position}"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pushNamed(context, '/adminJobDetail');
                          },
                          child: Text(
                            'More Info',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
