import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:freelance_exp/chat_screen.dart';
import 'package:freelance_exp/Pages/admin/admin_job_list.dart';
import 'package:freelance_exp/Pages/admin/admin_list.dart';
import 'package:freelance_exp/Pages/admin/admin_noti_list.dart';


class AdminHomePage extends StatefulWidget {

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

        ),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.red,
        activeIconColor: Colors.white,
        textColor: Colors.black,
        inactiveIconColor: Colors.black,
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
              }),
          TabData(
            iconData: Icons.work,
            title: "Notification",
          ),
          TabData(
              iconData: Icons.mail,
              title: "Chat"
          ),
          TabData(
            iconData: Icons.person,
            title: "Admin List",
          ),

        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }


  _getPage(int page) {
    switch (page) {
      case 0:
        return Scaffold(
         body : AdminJobList(),
        );
      case 1:
        return Scaffold(
         body: AdminNotiList(),
        );
      case 2:
        return Scaffold(
          body:ChatScreen(),
        );
      default:
        return Scaffold(
          body: AdminList(),
        );
    }
  }
}
