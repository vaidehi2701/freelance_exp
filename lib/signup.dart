import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:async';
import 'package:intl/intl.dart';


class sign_up extends StatefulWidget {
  @override
  _sign_upState createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {

  final nameValidation = new TextEditingController();
  final birthdateValidation = new TextEditingController();
  final mobileValidation = new TextEditingController();
  final secondMobileValidation = new TextEditingController();
  final emailValidation = new TextEditingController();
  final secondEmailValidation = new TextEditingController();
  final addressValidation = new TextEditingController();
  final tempAddressValidation = new TextEditingController();
  final adharCardValidation = new TextEditingController();
  final panCardValidation = new TextEditingController();


  String name;
  String birthdate;
  String mobile;
  String secondMobile;
  String email;
  String secondEmail;
  String address;
  String tempAddress;
  String adharCard;
  String panCard;
  String bday;


  DateTime date= DateTime.now();
  TimeOfDay time= TimeOfDay.now();

  File adharCardImage;
  File panCardImge;
  final Status = 'Done';




  Future ChooseEndDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;

    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      birthdateValidation.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }


  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

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
      child:   Column(
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


    // set up the SimpleDialog
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



  _displayDialog(BuildContext context) async {

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: ChooseGallery,
                        icon: Icon(Icons.image),
                      ),
                      Text('Gallery')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: ChooseCamera,
                        icon: Icon(Icons.camera_alt),
                      ),
                      Text('Camera')
                    ],
                  ),
                ]
              ),
            ],

          );
        });
  }
//


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black87
          ),
        ),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset('images/selection.png',
                      width: 260,
                      height: 160,),
                  ),

                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30 , right: 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 30),
                            child: Text('SIGN UP ',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 55),
                      Container(
                        width: double.infinity,
                        height: 1070,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 15),
                                blurRadius: 15,
                              ),
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, -10),
                                blurRadius: 15,
                              ),
                            ]),
                        child: Column(
                          children: <Widget>[
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: nameValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Name',
                                          labelText: 'Name'
                                      ),
                                      // validator : validateEmail,
                                      onSaved: (val) => name=val,
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: <Widget>[
                                      Expanded(
                                          child: new TextFormField(
                                            decoration: new InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter BirthDate',
                                              labelText: 'BirthDate',
                                            ),
                                            controller: birthdateValidation,
                                            keyboardType: TextInputType.datetime,
                                          )),
                                      IconButton(
                                          icon: new Icon(Icons.calendar_today,size: 25,textDirection: prefix0.TextDirection.ltr,),
                                          tooltip: 'Choose date',
                                          onPressed: (() {
                                            ChooseEndDate(context, birthdateValidation.text);
                                          }),
                                      ),
                                    ]),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: mobileValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Primary Contact Number',
                                          labelText: 'Primary Contact Number'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => mobile=val,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: secondMobileValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Secondary Contact Number',
                                          labelText: 'Secondary Contact Number(Optional)'
                                      ),
                                      onSaved: (val) => secondMobile=val,

                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: emailValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Primary Email',
                                          labelText: 'Primary Email'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => email=val,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: secondEmailValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Secondary Email',
                                          labelText: 'Secondary Email(Optional)'
                                      ),

                                      onSaved: (val) => secondEmail=val,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: addressValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Permanent Address',
                                          labelText: 'Permanent Address'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => address=val,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: tempAddressValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Temporary Address',
                                          labelText: 'Temporary Address'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => tempAddress=val,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: adharCardValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Adhar Card Number',
                                          labelText: 'Adhar Card Number'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => adharCard=val,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 5),
                                        Text("Upload Adhar Card:"),
                                        SizedBox(width: 15),
                                        RaisedButton(
                                          onPressed: (){
                                          showAlertDialog(context);
                                        },
                                          child: Text('Upload'),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            boxShadow: [ BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 2.0,
                                            ),]
                                        ),
                                        width: 350,
                                        height: 100,
                                        child: adharCardImage == null ? Text('no image') : Image.file(adharCardImage),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: panCardValidation,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your PAN Card Number',
                                          labelText: 'PAN Card Number'
                                      ),
                                      validator : validateMobile,
                                      onSaved: (val) => panCard=val,
                                    ),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 5),
                                        Text("Upload PAN Card:"),
                                        SizedBox(width: 15),
                                        RaisedButton(
                                          onPressed: () {
                                            showAlertDialog(context);
                                          },
                                          child: Text('Upload'),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            boxShadow: [ BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 2.0,
                                            ),]
                                        ),
                                        width: 350,
                                        height: 100,
                                        child: panCardImge == null ? Text('no image') : Image.file(panCardImge),
                                      ),
                                    ),

                                    SizedBox(height: 10),



                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Home');
                                },
                                padding: const EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                //color: Colors.cyan[100],
                                elevation: 20,
                                child:Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(

                                        colors: [
                                          Color.fromARGB(255, 148, 231, 225),
                                          Color.fromARGB(255, 62, 182, 226)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text('Sign Up' ,
                                      textAlign: TextAlign.center, style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.white
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset('images/image_02.png')
                    ],
                  ),
                ),
              ),



            ],
          ),
        ),

      ),
    );
  }
}







