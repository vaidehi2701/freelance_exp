import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:freelance_exp/Pages/contact_us.dart';
import 'package:freelance_exp/Widget/chat_screen.dart';
import 'package:freelance_exp/Widget/home_job_list.dart';
import 'package:freelance_exp/Widget/user_info_layout.dart';
import 'package:freelance_exp/Widget/your_job.dart';

class HomePage extends StatefulWidget {

  final String company;
  final String project;
  final String start;
  final String end;
  final String position;
  final String field;
  final String detail;

  HomePage(
      {Key key,
        this.company,
        this.project,
        this.start,
        this.end,
        this.position,
        this.field,
        this.detail
      }
      ) : super (key : key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
              }),
          TabData(
            iconData: Icons.work,
            title: "Your Job",
          ),
          TabData(
              iconData: Icons.mail,
              title: "Chat"
          ),
          TabData(
            iconData: Icons.person,
            title: "User Info",
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
            body : HomeJobList(),
        );
      case 1:
        return Scaffold(
          body: YourJob(),
        );
      case 2:
        return Scaffold(
          body: Chat(),
        );
      default:
        return Scaffold(
          body: UserInfo(),
        );
    }
  }
}
