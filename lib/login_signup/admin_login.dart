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
  final adminIdValidation = new TextEditingController();
  final adminPasswordValidation = new TextEditingController();

  String adminId;
  String adminPass;


  TextStyle Title = TextStyle(
      fontFamily: 'SEGOEUI',
      fontSize: 16,
      fontWeight: FontWeight.w500
  );

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
                              padding: const EdgeInsets.only(left: 10,top: 50),
                              child: Text('Admin Login ',
                                style: TextStyle(
                                    fontFamily: 'PlayFairDisplay',
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing:1.3,
                                    color: Colors.black
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
                                        controller: adminIdValidation,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Your Admin-id', hintStyle: Title,
                                            labelText: 'Admin Id',labelStyle: Title
                                        ),
                                        onSaved: (val) => adminId=val,
                                      ),
                                    ),

                                    SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25, right: 25 ),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.done,
                                        obscureText: true,
                                        controller: adminPasswordValidation,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password', hintStyle: Title,
                                          hintText: 'Enter Your Password',labelStyle: Title
                                        ),
                                        onSaved: (val) => adminPass=val,
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
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/adminHome');
                            },
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                  child:  Text('Login',
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.8,
                                          fontSize: 18,
                                          color: Colors.white),),
                                  ),
                            ),
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


