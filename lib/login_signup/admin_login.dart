import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';


class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final emailValidation = new TextEditingController();
  final mobileValidation = new TextEditingController();

  String email;
  String mobile;


  void submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.pushNamed(context, '/Otp');
    }
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
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
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
          body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
//                        Image.asset('image/logo.png',
//                            width : ScreenUtil.getInstance().setWidth(100),
//                            height : ScreenUtil.getInstance().setHeight(100)),

                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 50),
                              child: Text('Admin Login ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil.getInstance().setHeight(160)),
                        Container(width: double.infinity,
                          height: ScreenUtil.getInstance().setHeight(460),
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
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25, right: 25),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.done,
                                        controller: emailValidation,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Your Admin-id',
                                            labelText: 'Admin Id'
                                        ),
                                        validator : validateEmail,
                                        onSaved: (val) => email=val,
                                      ),
                                    ),

                                    SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25, right: 25 ),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.done,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                          hintText: 'Enter Your Password',
                                        ),
                                        validator : validateMobile,
                                        onSaved: (val) => mobile=val,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
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
                                    Navigator.pushNamed(context, '/adminHome');
                                  },
                                  child: Text('Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17),),
                                )),
                          ),
                        ),

                      ],

                    ),
                  ),

                )

        ),

      ],
    );


  }
}


