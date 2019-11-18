import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  final String type;

  Login({
    Key key,
    this.type,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final emailValidation = new TextEditingController();
  final mobileValidation = new TextEditingController();

  String email;
  String mobile;


  String text = "empty";

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

  String submit() {

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if(emailValidation.text.toString().trim().trimLeft().trimRight().toString().length != 0)
      {
        if (regex.hasMatch(emailValidation.text.trim().trimLeft().trimRight().toString()))
         { Navigator.pushNamed(context,'/verifyotp');
           return 'empty'; }
        else
          { return ' * Enter Valid Email Id'; }

      }
    else if(mobileValidation.text.toString().length > 0)
    {

      if (mobileValidation.text.toString().length == 10)
          { Navigator.pushNamed(context, '/verifyotp');
            return 'empty'; }

      else
        { return ' * Mobile Number must be of 10 digit'; }
      }
    else
      { return ' * Plese Fill Nessary Details'; }

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1400, allowFontScaling: true);
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/login_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 65),
                          child: Text(
                            '${widget.type} Login ',
                            style: TextStyle(
                                fontFamily: 'PlayFairDisplay',
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                letterSpacing:1.3,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(150)),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 15),
                              blurRadius: 15,
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, -10),
                              blurRadius: 15,
                            ),
                          ]),
                      child: Container(
                        margin: new EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 25),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mobile No',
                                  hintText:
                                  'Enter Your Mobile Number',
                                ),
                                controller: mobileValidation,
                              ),
                              SizedBox(height: 15),
                              Text('OR'),
                              SizedBox(height: 15),
                              TextField(
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                    hintText: 'Enter Your Email-id',
                                    labelText: 'Email Id'
                                ),
                                controller: emailValidation,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10),
                      child: Text(text == "empty" ? "" : text,style: TextStyle(
                          fontFamily: 'SEGOEUI',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(45)),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           text = submit();
                         });
                       },
                       child: Container(
                         height: 45,
                         width: 120,
                         decoration: BoxDecoration(
                           color: Colors.red,
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Center(
                             child: Text('Send OTP',
                           style: TextStyle(
                               fontFamily: 'Helvetica',
                               fontWeight: FontWeight.w500,
                               letterSpacing: 0.3,
                               fontSize: 17,
                               color: Colors.white),),

                         ),
                       ),
                     ),
                   ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/SignUp');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 13),
                        child: Text(
                          "Don't Have An Account ? ",
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.7,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        )

      ],
    );
  }
}
