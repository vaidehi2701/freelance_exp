import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}


class _ContactUsState extends State<ContactUs> {

    final url = 'www.shethgroupofindustries.com';

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration:new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/app_back.jpg"),
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
              title: Text("Contact Us",style: TextStyle(
                  color: Colors.black
              ),),
            ),
            body:  Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage('images/logo.jpg'),

                      ),
                    ),
                  ),
                ),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),)
                            ),
                            ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.black87,
                                ),
                                title: Text('Mihir Sheth',style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),)
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.home,
                                color: Colors.black87,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('B/227 Monalisha Business Center,'),
                                  Text('Manjalpur , Vadodara -390019'),
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
                                  title: Text('+91 9723312933')
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launch("mailto:shethserv@gmail.com"),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.mail,
                                    color: Colors.black87,
                                  ),
                                  title:  Text('shethserv@gmail.com')
                              ),
                            ),
                            GestureDetector(
                                onTap: () => launch("mailto:mihir@shethgroupofindustries.com"),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.mail,
                                      color: Colors.black87,
                                    ),
                                    title: Text('mihir@shethgroupofindustries.com'))
                            ),
                            GestureDetector(
                                onTap: () => launch('http://www.shethgroupofindustries.com'),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.wifi,
                                      color: Colors.black87,
                                    ),
                                    title:
                                    Text('www.shethgroupofindustries.com'))
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
