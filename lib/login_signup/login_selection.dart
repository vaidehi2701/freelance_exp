import 'package:flutter/material.dart';
import 'package:freelance_exp/login_signup/admin_login.dart';
import 'package:freelance_exp/login_signup/login.dart';
import 'dart:math';

class LoginSelection extends StatefulWidget {
  @override
  _LoginSelectionState createState() => _LoginSelectionState();
}

class _LoginSelectionState extends State<LoginSelection>
    with SingleTickerProviderStateMixin {
  final type = "name";
  int value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/logo.jpg'),
            height: 80,
            width: 80,
          ),
          Column(
            children: <Widget>[
              Text('Login As'),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              value = 1;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/admin.png'),
                            radius: value == 1 ? 65 : 40,
                          ),
                        ),
                        SizedBox(height: 10),
                        value == 1
                            ? Text(
                                'Admin',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                'Admin',
                                style: TextStyle(fontSize: 16),
                              ),
                        SizedBox(height: 10),
                        value == 1
                            ? Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/adminLogin');
                                    },
                                    child: Icon(Icons.keyboard_arrow_right)),
                              )
                            : Container(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              value = 2;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/user.png'),
                            radius: value == 2 ? 65 : 40,
                          ),
                        ),
                        SizedBox(height: 10),
                        value == 2
                            ? Text(
                                'User',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                'User',
                                style: TextStyle(fontSize: 16),
                              ),
                        SizedBox(height: 10),
                        value == 2
                            ? Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: GestureDetector(
                                    onTap: () {
                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new Login(
                                          type: "User",
                                        ),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Icon(Icons.keyboard_arrow_right)),
                              )
                            : Container(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              value = 3;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/client.png'),
                            radius: value == 3 ? 65 : 40,
                          ),
                        ),
                        SizedBox(height: 10),
                        value == 3
                            ? Text(
                                'Client',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                'Client',
                                style: TextStyle(fontSize: 16),
                              ),
                        SizedBox(height: 10),
                        value == 3
                            ? Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: GestureDetector(
                                    onTap: () {
                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new Login(
                                          type: "Client",
                                        ),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Icon(Icons.keyboard_arrow_right)),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40)
            ],
          ),
        ],
      ),
    );
  }
}
