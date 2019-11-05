
import 'package:flutter/material.dart';
import 'package:freelance_exp/add_work_experience.dart';
import 'package:freelance_exp/home.dart';
import 'package:freelance_exp/login.dart';
import 'package:freelance_exp/signup.dart';


import 'add_skill.dart';
import 'admin_login.dart';
import 'login_selection.dart';
import 'verify_otp.dart';


void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/' :(context) => LoginSelection(),
    '/login' :(context) => Login(),
    '/verifyotp' :(context) => VerifyOtp(),
    '/adminLogin' :(context) => AdminLogin(),
    '/SignUp':(context) => sign_up(),
    '/Home':(context) => HomePage(),
    '/addWorkExperience':(context) => AddWorkExperience(),
    '/addSkill':(context) => AddSkill(),



  },

));
