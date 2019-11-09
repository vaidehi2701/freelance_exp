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
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Column(
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
            child: Column(
              children: <Widget>[

                Card(
                  color: Colors.white,
                  child: ListTile(
                      leading: Icon(
                        Icons.person_pin,
                        color: Colors.black87,
                      ),
                      title: Text('Sheth Corrosion & Coatings Pvt Ltd',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                    title: Text('Mihir Sheth',style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),)
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
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
                ),
                Card(
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => launch("tel://9723312933"),
                    child: ListTile(
                        leading: Icon(
                          Icons.call,
                          color: Colors.black87,
                        ),
                        title: Text('+91 9723312933')
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => launch("mailto:shethserv@gmail.com"),
                    child: ListTile(
                        leading: Icon(
                          Icons.mail,
                          color: Colors.black87,
                        ),
                        title:  Text('shethserv@gmail.com')
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                    child:GestureDetector(
                        onTap: () => launch("mailto:mihir@shethgroupofindustries.com"),
                     child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.black87,
                      ),
                      title: Text('mihir@shethgroupofindustries.com'))
                  ),
                ),
                Card(
                  color: Colors.white,
                  child:GestureDetector(
                        onTap: () => launch('http://www.shethgroupofindustries.com'),
                    child: ListTile(
                      leading: Icon(
                        Icons.wifi,
                        color: Colors.black87,
                      ),
                      title:
                          Text('www.shethgroupofindustries.com'))
                  ),
                ),
              ],
            ),
          ),
        ],
      )
//      Padding(
//        padding: const EdgeInsets.all(10),
//        child: Card(
//          child: Container(
//            width: double.infinity,
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(10),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey,
//                    offset: Offset(0, 10),
//                    blurRadius: 10,
//                  ),
//                  BoxShadow(
//                    color: Colors.grey,
//                    offset: Offset(0, -8),
//                    blurRadius: 10,
//                  ),
//                ]),
//            child: Padding(
//              padding: const EdgeInsets.all(15.0),
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Icon(Icons.person),
//                      SizedBox(width: 10),
//                      Text('Sheth Corrosion & Coatings Pvt Ltd')
//                    ],
//                  ),
//                  SizedBox(height: 10),
//
//                  SizedBox(height: 10),
//                  Row(
//                    children: <Widget>[
//                      Icon(Icons.business),
//                      SizedBox(width: 10),
//                      Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Text('B/227 Monalisha Business Center,'),
//                          Text('Manjalpur , Vadodara -390019'),
//                        ],
//                      ),
//
//                    ],
//                  ),
//                  SizedBox(height: 10),
//                  GestureDetector(
//
//                    child: Row(
//                      children: <Widget>[
//                        Icon(Icons.call),
//                        SizedBox(width: 10),
//
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 10),
//                  GestureDetector(
//
//                    child: Row(
//                      children: <Widget>[
//                        Icon(Icons.email),
//                        SizedBox(width: 10),
//
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 10),
//                  GestureDetector(
//
//                    child: Row(
//                      children: <Widget>[
//                        Icon(Icons.email),
//                        SizedBox(width: 10),
//
//                      ],
//                    ),
//                  ),
//
//                  SizedBox(height: 10),
//                  GestureDetector(
//
//                    child: Row(
//                      children: <Widget>[
//                        Icon(Icons.network_check),
//                        SizedBox(width: 10),
//
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            )
//          ),
//        ),
//      ),
    );
  }
}
