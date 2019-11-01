import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomePage extends StatefulWidget {

  final String company;
  final String project;
  final String start;
  final String end;
  final String position;
  final String field;
  final String detail;

  HomePage(
      {Key key,
        this.company,
        this.project,
        this.start,
        this.end,
        this.position,
        this.field,
        this.detail
      }
      ) : super (key : key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
//                final FancyBottomNavigationState fState =
//                    bottomNavigationKey.currentState;
//                fState.setPage(2);
              }),
          TabData(
            iconData: Icons.work,
            title: "Your Job",
//              onclick: () => Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => SecondPage()))
          ),
          TabData(
              iconData: Icons.mail,
              title: "Chat"
          ),
          TabData(
            iconData: Icons.notifications,
            title: "Notification",
//              onclick: () => Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => SecondPage()))
          ),
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[Text("Hello"), Text("World")],
//        ),
//      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Card(
              child: Container(
                height: 110,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Job Title : " , style: TextStyle(
                              fontSize: 16 , fontWeight: FontWeight.bold
                          ),),
                          // Text("${widget.company}"),
                        ],
                      ),

                      SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Text("Client : " , style: TextStyle(
                              fontSize: 16 , fontWeight: FontWeight.bold
                          ),),
                          //Text("${widget.position}"),
                        ],
                      ),
                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Start Date : " , style: TextStyle(
                                  fontSize: 16 , fontWeight: FontWeight.bold
                              ),),
                              //Text("${widget.start}"),
                            ],
                          ),

                          SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Text("End Date : " , style: TextStyle(
                                  fontSize: 16 , fontWeight: FontWeight.bold
                              ),),
                              //Text("${widget.end}"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Text("Job"),
          ),
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Text("Chat"),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text("Notification"),
          ),

        );
    }
  }
}
