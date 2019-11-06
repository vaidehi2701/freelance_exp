
import 'package:flutter/material.dart';
import 'package:freelance_exp/Pages/add_work_experience.dart';
import 'package:freelance_exp/Pages/home.dart';
import 'package:freelance_exp/Pages/login.dart';
import 'package:freelance_exp/Pages/signup.dart';


import 'Pages/add_skill.dart';
import 'Pages/admin_login.dart';
import 'Pages/login_selection.dart';
import 'Pages/verify_otp.dart';


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
