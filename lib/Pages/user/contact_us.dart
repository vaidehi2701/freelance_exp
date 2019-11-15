import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}


class _ContactUsState extends State<ContactUs> {

    final url = 'www.shethgroupofindustries.com';
    TextStyle ToolbarTitle = TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: Colors.black
    );

    TextStyle Title = TextStyle(
        fontFamily: 'SEGOEUI',
        fontSize: 16,
        fontWeight: FontWeight.w500
    );

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration:new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text("Contact Us",style: ToolbarTitle),
            ),
            body:  Column(
              children: <Widget>[
                SizedBox(height: 15),
                Image(
                  image: AssetImage('images/logo.png'),
                  height: 100,
                  width: 100,
                ),
                RichText(
                  text: TextSpan(
                    text: " FREELANC",
                    style: TextStyle(color: Colors.black, letterSpacing: 1),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'EXP  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                leading: Icon(
                                  Icons.person_pin,
                                  color: Colors.black87,
                                ),
                                title: Text('Sheth Corrosion & Coatings Pvt Ltd',
                                  style: Title)
                            ),
                            ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.black87,
                                ),
                                title: Text('Mihir Sheth',style: Title)
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.home,
                                color: Colors.black87,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('B/227 Monalisha Business Center,' ,style: Title),
                                  Text('Manjalpur , Vadodara -390019',style: Title),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launch("tel://9723312933"),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.call,
                                    color: Colors.black87,
                                  ),
                                  title: Text('+91 9723312933',style: Title)
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launch("mailto:shethserv@gmail.com"),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.mail,
                                    color: Colors.black87,
                                  ),
                                  title:  Text('shethserv@gmail.com',style: Title)
                              ),
                            ),
                            GestureDetector(
                                onTap: () => launch("mailto:mihir@shethgroupofindustries.com"),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.mail,
                                      color: Colors.black87,
                                    ),
                                    title: Text('mihir@shethgroupofindustries.com',style: Title))
                            ),
                            GestureDetector(
                                onTap: () => launch('http://www.shethgroupofindustries.com'),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.open_in_browser,
                                      color: Colors.black87,
                                    ),
                                    title:
                                    Text('www.shethgroupofindustries.com',style: Title))
                            ),
                          ],
                        ),
                      ),

                ),
              ],
            )
        ),

      ],
    );
  }
}
