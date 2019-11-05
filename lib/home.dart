import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:freelance_exp/add_work_experience.dart';

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
              iconData: Icons.person,
              title: "User Info",
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
            title: Text("User Info"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Skills',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          FlatButton(
                            child: Icon(Icons.add,color: Colors.black),
                            onPressed: (){
                              Navigator.pushNamed(context, '/addSkill');
                            },
                          )
                        ],
                      ),
                      Divider(height: 1,color: Colors.black),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text('first'),
                          ),
                          SizedBox(width: 10),
                          Chip(
                            label: Text('first'),
                          ),
                          SizedBox(width: 10),
                          Chip(
                            label: Text('first'),
                          )
                        ],
                      ),
                    ],
                  ),
            ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Work Experience',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                          FlatButton(
                            child: Icon(Icons.add,color: Colors.black),
                            onPressed: (){
                              Navigator.pushNamed(context,'/addWorkExperience');
                            },
                          )
                        ],
                      ),
                    Divider(height: 1,color: Colors.black),
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Job Title : " , style: TextStyle(
                                          fontSize: 16 , fontWeight: FontWeight.w500
                                      ),),
                                      // Text("${widget.company}"),
                                       PopupMenuButton(
                                          child: Icon(Icons.menu),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: GestureDetector(
                                                  onTap:(){Navigator.pushNamed(context,'/addWorkExperience');},
                                                  child: Text("Edit")),
                                            ),
                                            PopupMenuItem(
                                              child: Text("Delete"),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("Start Date : " , style: TextStyle(
                                              fontSize: 16 , fontWeight: FontWeight.w500
                                          ),),
                                          //Text("${widget.start}"),
                                        ],
                                      ),

                                      SizedBox(height: 8),
                                      Row(
                                        children: <Widget>[
                                          Text("End Date : " , style: TextStyle(
                                              fontSize: 16 , fontWeight: FontWeight.w500
                                          ),),
                                          //Text("${widget.end}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: <Widget>[
                                      Text("Company Name : " , style: TextStyle(
                                          fontSize: 16 , fontWeight: FontWeight.w500
                                      ),),
                                      //Text("${widget.position}"),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                     ),
                  ],
                ),
              ),

            ],
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
