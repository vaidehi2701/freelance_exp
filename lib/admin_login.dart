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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image.asset('images/selection.png' ,
                    width: 280,
                    height: 210,),
                ),
                Expanded(
                    child: Container()),
              ],
            ),
            SingleChildScrollView(
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
                      height: ScreenUtil.getInstance().setHeight(450),
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
                          SizedBox(height: 50),
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
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: RaisedButton(
                              onPressed: () {submit();},
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              //color: Colors.cyan[100],
                              elevation: 20,
                              child:Container(
                                width: 150,
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
                                  child: Text('Login' ,
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

                    Image.asset('images/image_02.png')
                  ],

                ),
              ),

            )
          ],
        ),
      ),

    );


  }
}


