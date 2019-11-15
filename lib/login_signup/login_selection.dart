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



  TextStyle Notselected = TextStyle(
      fontFamily: 'SEGOEUI',
      fontSize: 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500
  );

  TextStyle Selected = TextStyle(
      fontFamily: 'SEGOEUI',
      fontSize: 18,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w700
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
              image: new AssetImage("images/splash_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image(
                image: AssetImage('images/logo.png'),
                height: 150,
                width: 150,
              ),
              RichText(
                text: TextSpan(
                  text: " FREELANC",
                  style: TextStyle(color: Colors.black, letterSpacing: 1),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'EXP  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1)),
                  ],
                ),
              ),
              SizedBox(height: 90),
              Text(
                'Login As',
                style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7),
              ),
              SizedBox(height: 50),
              Container(
                height: 220,
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
                                style: Selected
                              )
                            : Text(
                                'Admin',
                                style:Notselected
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
                                    child: Icon(Icons.arrow_forward)),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(width: 5),
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
                            backgroundImage: AssetImage('images/user_girl.png'),
                            radius: value == 3 ? 65 : 40,
                          ),
                        ),
                        SizedBox(height: 10),
                        value == 3
                            ? Text(
                          'Client',
                          style: Selected
                        )
                            : Text(
                          'Client',
                          style: Notselected
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
                              child: Icon(Icons.arrow_forward)),
                        )
                            : Container(),
                      ],
                    ),
                    SizedBox(width: 5),
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
                                style: Selected
                              )
                            : Text(
                                'User',
                                style: Notselected
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
                                    child: Icon(Icons.arrow_forward)),
                              )
                            : Container(),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
