import 'package:flutter/material.dart';
import 'package:freelance_exp/admin_login.dart';
import 'package:freelance_exp/login.dart';
import 'dart:math';
class LoginSelection extends StatefulWidget {
  @override
  _LoginSelectionState createState() => _LoginSelectionState();
}

class _LoginSelectionState extends State<LoginSelection> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final  type ="name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('images/.jpg'),
                    fit: BoxFit.cover
                ),
              ),
            ),

           ScaleTransition(
             scale: animation,
             child: Padding(
               padding: const EdgeInsets.only(top: 180,right: 130,left: 130),
               child: Container(
                    height: 190,
                    width: 190,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                          image: AssetImage('images/logo.jpg'),

                      ),
                    ),
                  ),
             ),
           ),


            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Login As" ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                          padding: const EdgeInsets.only(top: 30),
                              child: Container(
                                 child: RaisedButton(
                                  onPressed: () {
                                    var route = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      new Login(
                                          type: "User",
                                      ),
                                    );
                                    Navigator.of(context).push(route);
                                  },
                                      padding: const EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              //color: Colors.cyan[100],
                                      elevation: 0,
                                  child:Container(
                                    width: 130,
                                    height: 45,
                                    decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                    colors: [
                                    Color.fromARGB(255, 148, 231, 225),
                                    Color.fromARGB(255, 62, 182, 226)
                                    ],
                                    ),
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                      padding: const EdgeInsets.all(10),
                                      child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                          child: Text('User' ,
                                          textAlign: TextAlign.center, style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.white
                                          ),),
                                      ),
                                  ),
                                 ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: RaisedButton(

                                onPressed: () {
                                  var route = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new Login(
                                      type: "Client",
                                    ),
                                  );
                                  Navigator.of(context).push(route);
                                },
                                padding: const EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                //color: Colors.cyan[100],
                                elevation: 0,
                                child:Container(
                                  width: 130,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 148, 231, 225),
                                          Color.fromARGB(255, 62, 182, 226)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text('Client' ,
                                      textAlign: TextAlign.center, style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.white
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                      child: Container(
                       child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,'/adminLogin');
                          },
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          //color: Colors.cyan[100],
                          elevation: 0,
                         child:Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [
                            Color.fromARGB(255, 148, 231, 225),
                            Color.fromARGB(255, 62, 182, 226)
                            ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                              padding: const EdgeInsets.all(10),
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text('Admin' ,
                                  textAlign: TextAlign.center, style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white
                                    ),),
                              ),
                         ),
                       ),
                      ),
                  )
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
