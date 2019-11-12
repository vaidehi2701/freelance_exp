import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';


class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TabController _controller;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(new Duration(days: 7));

  Future date(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: startDate,
        initialLastDate: endDate,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2023));
    if (picked != null && picked.length == 2) {
      setState(() {
        startDate = picked[0];
        endDate = picked[1];
      });
    }
  }

  File image;

  ChooseGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      print(img.path);
      setState(() {
        image = img;
        Navigator.of(context).pop();
      });
    }
  }

  ChooseCamera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      print(img.path);
      setState(() {
        image = img;
        Navigator.of(context).pop();
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: Column(
        children: <Widget>[
          IconButton(
            onPressed: ChooseCamera,
            icon: Icon(Icons.camera_alt),
          ),
          Text('Camera')
        ],
      ),
    );
    Widget optionTwo = SimpleDialogOption(
      child: Column(
        children: <Widget>[
          IconButton(
            onPressed: ChooseGallery,
            icon: Icon(Icons.image),
          ),
          Text('Gallery')
        ],
      ),
    );

    SimpleDialog dialog = SimpleDialog(
      title: const Text('Choose an Option'),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            optionOne,
            optionTwo,
          ],
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  Widget getProfilePicture({String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        width: 100.0,
        height: 100.0,
        child: Stack(children: [
          getImage(),
          image == null ? _getPlusIcon() : Container()
        ]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      left: 65,
      top: 65,
      child: Container(
          width: 25, // PlusIconSize = 20.0;
          height: 25, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(50.0)),
          child: GestureDetector(
            onTap: () {
              showAlertDialog(context);
            },
            child: Icon(Icons.add, color: Colors.white, size: 25.0),
          )),
    );
  }

  Widget getImage() {
    return Positioned(
        child: Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(),
      child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: image == null
                    ? AssetImage('images/noprofile.jpg')
                    : FileImage(image),
                // image: FileImage(image)
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.black)])),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/try.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        MaterialApp(
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: new AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "User Info",
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/notification');
                            },
                            child: Icon(Icons.notifications)),
                        SizedBox(width: 15),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/contactUs');
                            },
                            child: Icon(Icons.contact_phone))
                      ],
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 0.75))
                              ],
                            ),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'UserName',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      child: new TabBar(
                                        controller: _controller,
                                        labelColor: Colors.red,
                                        indicatorColor: Colors.red,
                                        unselectedLabelColor: Colors.red[300],
                                        tabs: [
                                          Tab(
                                            text: 'Summary',
                                          ),
                                          Tab(
                                            text: 'Avability',
                                          ),
                                          Tab(
                                            text: 'Work Experience',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 550,
                            child: new TabBarView(
                              controller: _controller,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Personal Info',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FlatButton(
                                            child: Icon(Icons.edit,
                                                color: Colors.black),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/SignUp');
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(height: 1, color: Colors.black),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.mail,
                                                color: Colors.blueGrey,
                                                size: 20,
                                              ),
                                              SizedBox(width: 15),
                                              Text(
                                                'abc@gmail.com',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.call,
                                                color: Colors.blueGrey,
                                                size: 20,
                                              ),
                                              SizedBox(width: 15),
                                              Text(
                                                '9974922041',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Skills',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FlatButton(
                                            child: Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/addSkill');
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 1,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Chip(
                                            label: Text('first'),
                                          ),
                                          SizedBox(width: 10),
                                          Chip(
                                            label: Text('first'),
                                          ),
                                          SizedBox(width: 10),
                                          Chip(
                                            label: Text('first'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Select Your Avaiblity',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FlatButton(
                                            child: Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () async{
                                              await date(context);
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(height: 5,color: Colors.grey),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Start Date',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  'End Date',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  'Status',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Divider(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                    ' ${DateFormat('dd/MM/yyyy').format(startDate).toString()}'),
                                                Text(
                                                    ' ${DateFormat('dd/MM/yyyy').format(endDate).toString()}'),
                                                Text('Avaiable'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Work Experience',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FlatButton(
                                            child: Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  '/addWorkExperience');
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(height: 1, color: Colors.black),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Card(
                                          child: Container(
                                            height: 110,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, 10),
                                                    blurRadius: 10,
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0, -8),
                                                    blurRadius: 10,
                                                  ),
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "Job Title : ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      // Text("${widget.company}"),
                                                      PopupMenuButton(
                                                        child: Icon(
                                                            Icons.more_vert),
                                                        itemBuilder:
                                                            (context) => [
                                                          PopupMenuItem(
                                                            child:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pushNamed(
                                                                          context,
                                                                          '/addWorkExperience');
                                                                    },
                                                                    child: Text(
                                                                        "Edit")),
                                                          ),
                                                          PopupMenuItem(
                                                            child:
                                                                Text("Delete"),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            "Start Date : ",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          //Text("${widget.start}"),
                                                        ],
                                                      ),
                                                      SizedBox(height: 8),
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            "End Date : ",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          //Text("${widget.end}"),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Company Name : ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      //Text("${widget.position}"),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: getProfilePicture()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
