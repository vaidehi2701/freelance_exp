
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:freelance_exp/Pages/Notification.dart' as prefix0;
import 'package:freelance_exp/Pages/add_work_experience.dart';
import 'package:freelance_exp/Pages/home.dart';
import 'package:freelance_exp/Pages/login.dart';
import 'package:freelance_exp/Pages/signup.dart';
import 'package:freelance_exp/Pages/Notification.dart';


import 'Pages/add_skill.dart';
import 'Pages/admin_login.dart';
import 'Pages/avability_date.dart';
import 'Pages/contact_us.dart';
import 'Pages/job_details.dart';
import 'Pages/login_selection.dart';
import 'Pages/verify_otp.dart';
import 'Widget/chat_screen.dart';
import 'Widget/your_job.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
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
    '/notification':(context) => prefix0.Notification(),
    '/jobDetail':(context) => JobDetail(),
    '/contactUs':(context) => ContactUs(),
    '/avaiblityDate':(context) => AvaiblityDate(),
    '/yourJob':(context) => YourJob(),

  },

));
