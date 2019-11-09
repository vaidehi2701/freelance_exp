import 'package:flutter/material.dart';
import 'package:freelance_exp/Pages/avability_date.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  File panCardImge;

  ChooseGallery()async{
    File img =await ImagePicker.pickImage(source: ImageSource.gallery);
    if(img != null){
      print(img.path);
      setState(() {
        panCardImge=img;
        Navigator.of(context).pop();
      });

    }
  }
  ChooseCamera()async{
    File img =await ImagePicker.pickImage(source: ImageSource.camera);
    if(img != null){
      print(img.path);
      setState(() {
        panCardImge=img;
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
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 100.0,
        height: 100.0,
        child: Stack(
            children: [
              _getProfilePicture(), _getPlusIcon()
            ]
        )
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      left: 65,
      top: 70,
//      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: 25, // PlusIconSize = 20.0;
          height: 25, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: GestureDetector(
            onTap: (){
              showAlertDialog(context);
            },
            child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.0
            ),
          )),);
  }
  Widget _getProfilePicture() {
    return Positioned(
        child: Container(
            padding: EdgeInsets.all(1.0),
            height: 95,
            width: 95,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(90 / 2)
            ),
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("User Info"),
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/notification');
                    },
                    child: Icon(Icons.notifications)),
                SizedBox(width: 15),
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/contactUs');
                    },
                    child: Icon(Icons.contact_phone))
              ],
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                children: <Widget>[
                  getProfilePicture(),
                  Text('Mr. Ashok Patel', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Personal Info', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                      FlatButton(
                        child: Icon(Icons.edit, color: Colors.black),
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                      )
                    ],
                  ),
                  Divider(height: 1, color: Colors.black),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Text('Email :', style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          Text('abc@gmail.com', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Text('Contact Number :', style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          Text('9974922041', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Skills', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                      FlatButton(
                        child: Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          Navigator.pushNamed(context, '/addSkill');
                        },
                      )
                    ],
                  ),
                  Divider(height: 1, color: Colors.black),
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Work Experience', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                      FlatButton(
                        child: Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          Navigator.pushNamed(context, '/addWorkExperience');
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
                            borderRadius: BorderRadius.circular(10),
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Text("Job Title : ", style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500
                                  ),),
                                  // Text("${widget.company}"),
                                  PopupMenuButton(
                                    child: Icon(Icons.more_vert),
                                    itemBuilder: (context) =>
                                    [
                                      PopupMenuItem(
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  '/addWorkExperience');
                                            },
                                            child: Text("Edit")),
                                      ),
                                      PopupMenuItem(
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("Start Date : ", style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      //Text("${widget.start}"),
                                    ],
                                  ),

                                  SizedBox(height: 8),
                                  Row(
                                    children: <Widget>[
                                      Text("End Date : ", style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      //Text("${widget.end}"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: <Widget>[
                                  Text("Company Name : ", style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500
                                  ),),
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
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/avaiblityDate');
                },
                child: Text('click for avaiblity'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
