import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';

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

  bool visibilityEmail = false;
  bool visibilityCall = false;

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

  void submit() {
    //  final form = formKey.currentState;
    Navigator.pushNamed(context, '/verifyotp');
//    if (form.validate()) {
//      form.save();
//      Navigator.pushNamed(context, '/Otp');
//
//    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
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
//                        Image.asset('image/logo.png',
//                            width : ScreenUtil.getInstance().setWidth(100),
//                            height : ScreenUtil.getInstance().setHeight(100)),

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
                      height: ScreenUtil.getInstance().setHeight(645),
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
                          child: Form(
                            key: formKey,
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: FlutterRadioButtonGroup(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      items: ["None", "Call", "Email"],
                                      onSelected: (String selected) {
                                        print("Selected: $selected");
                                        if (selected == "Call") {
                                          setState(() {
                                            visibilityCall = true;
                                          });
                                        } else if (selected == "Email") {
                                          setState(() {
                                            visibilityEmail = true;
                                          });
                                        }
                                      }),
                                ),
                                visibilityCall
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 11,
                                            child: new TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Mobile No',
                                                hintText:
                                                    'Enter Your Mobile Number',
                                              ),
                                              validator: validateMobile,
                                              onSaved: (val) => mobile = val,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: new IconButton(
                                              color: Colors.grey[400],
                                              icon: const Icon(
                                                Icons.cancel,
                                                size: 22.0,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  visibilityCall = false;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : new Container(),
                                SizedBox(height: 20),
                                visibilityEmail
                                    ? new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          new Expanded(
                                            flex: 11,
                                            child: TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText:
                                                      'Enter Your Email-id',
                                                  labelText: 'Email'),
                                              validator: validateEmail,
                                              onSaved: (val) => email = val,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: new IconButton(
                                              color: Colors.grey[400],
                                              icon: const Icon(
                                                Icons.cancel,
                                                size: 22.0,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  visibilityEmail = false;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : new Container(),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(45)),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: Container(
                       height: 45,
                       width: 120,
                       decoration: BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(10)
                       ),
                       child: Center(
                           child: GestureDetector(
                             onTap: (){
                               Navigator.pushNamed(context, '/verifyotp');
                             },
                             child: Text('Login',
                         style: TextStyle(
                             fontFamily: 'Helvetica',
                             fontWeight: FontWeight.w500,
                             letterSpacing: 0.8,
                             fontSize: 18,
                             color: Colors.white),),
                           )),
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
