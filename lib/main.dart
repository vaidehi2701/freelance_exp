
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:freelance_exp/Pages/admin/add_job_details.dart';
import 'package:freelance_exp/Pages/admin/admin_job_detail.dart';
import 'package:freelance_exp/Pages/admin/admin_job_user.dart';
import 'package:freelance_exp/Pages/admin/admin_job_user_chat.dart';
import 'package:freelance_exp/Pages/admin/applied_user_list.dart';
import 'package:freelance_exp/Pages/user/client_noti_list.dart' as prefix0;
import 'package:freelance_exp/Pages/admin/add_notification.dart';
import 'package:freelance_exp/Pages/user/add_work_experience.dart';
import 'package:freelance_exp/Pages/user/contact_us.dart';
import 'package:freelance_exp/Pages/user/user_home.dart';
import 'package:freelance_exp/Pages/user/user_info_layout.dart';
import 'package:freelance_exp/login_signup/login.dart';
import 'package:freelance_exp/login_signup/login_selection.dart';
import 'package:freelance_exp/login_signup/signup.dart';
import 'package:freelance_exp/login_signup/your_job.dart';


import 'Pages/admin/add_admin.dart';
import 'Pages/user/add_skill.dart';
import 'Pages/admin/admin_home.dart';
import 'login_signup/admin_login.dart';
import 'Pages/user/job_details.dart';
import 'login_signup/verify_otp.dart';


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
    '/yourJob':(context) => YourJob(),
    '/adminHome':(context) => AdminHomePage(),
    '/addNotification':(context) => AddNotification(),
    '/addAdmin':(context) => AddAdmin(),
    '/userInfo':(context) => UserInfo(),
    '/addJobDetail':(context) => AddJobDetail(),
    '/adminJobUser':(context) => AdminJobUser(),
    '/adminJobUserChat':(context) => AdminJobUserChat(),
    '/adminJobDetail':(context) => AdminJobDetail(),
    '/appliedUserList':(context) => AppliedUserList(),



  },

));
