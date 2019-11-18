import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroSlider extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: Colors.lightBlue[400],
        bubble: Image.asset('images/logo.png'),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Fill Up simple Form and do register As Freelancer and get a job.',
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Text(
            'Get Your Job',
          ),
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
        bodyTextStyle:
            TextStyle(fontFamily: 'SEGOEUI', color: Colors.white, fontSize: 20),
        mainImage: Image.asset(
          'images/job.png',
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: Colors.orange[400],
      iconImageAssetPath: 'images/logo.png',
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          'Fill Up all necessary Details and get a automated genrated Resume that will send to client for their Job Requirement.',
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Text('Automatic Resume'),
      ),
      mainImage: Image.asset(
        'images/resume.png',
        height: 140.0,
        width: 140.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5),
      bodyTextStyle:
          TextStyle(fontFamily: 'SEGOEUI', color: Colors.white, fontSize: 20),
    ),
    PageViewModel(
      pageColor: Colors.blueGrey[400],
      iconImageAssetPath: 'images/logo.png',
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          'You Can Find Number Of Jobs  with different categories and options and also u can apply directly with this app',
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Text('Find job'),
      ),
      mainImage: Image.asset(
        'images/list_job.png',
        height: 170.0,
        width: 170.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5),
      bodyTextStyle:
          TextStyle(fontFamily: 'SEGOEUI', color: Colors.white, fontSize: 20),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.pushNamed(context, '/loginSelection');
          },
          pageButtonTextStyles: TextStyle(
              fontFamily: 'SEGOEUI', color: Colors.white, fontSize: 16),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
