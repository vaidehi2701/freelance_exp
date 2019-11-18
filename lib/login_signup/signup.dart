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
        adharCardImage=img;
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
        adharCardImage=img;
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

  TextStyle Title = TextStyle(
      fontFamily: 'SEGOEUI',
      fontSize: 16,
      fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {



    final NameWidget =
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: nameValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Name', hintStyle: Title,
          labelText: 'Name',labelStyle: Title
      ),
      // validator : validateEmail,
      onSaved: (val) => name=val,
    );

    final BdayWidget =
    Row(children: <Widget>[
      Expanded(
          child: new TextFormField(
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter BirthDate', hintStyle: Title,
              labelText: 'BirthDate',labelStyle: Title
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
    ]);

    final PrimaryNumberWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: mobileValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Primary Contact Number', hintStyle: Title,
          labelText: 'Primary Contact Number' ,labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => mobile=val,
    );

    final SecondaryNumberWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: secondMobileValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Secondary Contact Number', hintStyle: Title,
          labelText: 'Secondary Contact Number(Optional)', labelStyle: Title
      ),
      onSaved: (val) => secondMobile=val,
    );

    final PrimaryEmailWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: emailValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Primary Email', hintStyle: Title,
          labelText: 'Primary Email',labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => email=val,
    );

    final SecondaryEmailWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: secondEmailValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Secondary Email', hintStyle: Title,
          labelText: 'Secondary Email(Optional)', labelStyle: Title
      ),

      onSaved: (val) => secondEmail=val,
    );

    final PermanentAddressWidget= TextFormField(
      textInputAction: TextInputAction.next,
      controller: addressValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Permanent Address', hintStyle: Title,
          labelText: 'Permanent Address',labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => address=val,
    );

    final TemporaryAddressWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: tempAddressValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Temporary Address',hintStyle: Title,
          labelText: 'Temporary Address',labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => tempAddress=val,
    );

    final AdharCardWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: adharCardValidation,

      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Adhar Card Number', hintStyle: Title,
          labelText: 'Adhar Card Number',labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => adharCard=val,
    );

    final PanCardWidget =
    TextFormField(
      textInputAction: TextInputAction.done,
      controller: panCardValidation,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your PAN Card Number', hintStyle: Title,
          labelText: 'PAN Card Number', labelStyle: Title
      ),
      validator : validateMobile,
      onSaved: (val) => panCard=val,
    );

    final SignUpButton=
    Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/Home');
              },
              child: Text('SignUp',
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    fontSize: 18,
                    color: Colors.white),),
            )),
      ),
    );


    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/login_back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15 , right: 15),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 55),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 30),
                        child: Text('SIGN UP ',
                          style: TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              letterSpacing:1.3,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55),
                  Container(
                    width: double.infinity,
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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                NameWidget,

                                SizedBox(height: 10),
                                BdayWidget,

                                SizedBox(height: 10),
                                PrimaryNumberWidget,

                                SizedBox(height: 10),
                                SecondaryNumberWidget,

                                SizedBox(height: 10),
                                PrimaryEmailWidget,

                                SizedBox(height: 10),
                                SecondaryEmailWidget,

                                SizedBox(height: 10),
                                PermanentAddressWidget,

                                SizedBox(height: 10),
                                TemporaryAddressWidget,

                                SizedBox(height: 10),
                                AdharCardWidget,
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Text("Upload Adhar Card:",style: Title,),
                                    SizedBox(width: 15),

                                    RaisedButton(
                                      color: Colors.red[400],
                                      onPressed: (){
                                        showAlertDialog(context);
                                      },
                                      child: Text('Upload',style: TextStyle(
                                          fontFamily: 'SEGOEUI',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        color: Colors.white
                                      ),),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: adharCardImage == null ? AssetImage('images/noprofile.jpg') : FileImage(adharCardImage),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 2.0,
                                          ),]
                                    ),


                                  ),
                                ),

                                SizedBox(height: 10),
                                PanCardWidget,
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Text("Upload PAN Card:",style: Title,),
                                    SizedBox(width: 15),
                                    RaisedButton(
                                      color: Colors.red[400],
                                      onPressed: () {
                                        showAlertDialog(context);
                                      },

                                      child: Text('Upload',style: TextStyle(
                                          fontFamily: 'SEGOEUI',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white
                                      )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: panCardImge == null  ? AssetImage('images/noprofile.jpg') : FileImage(panCardImge),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        boxShadow: [ BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 2.0,
                                        ),]
                                    ),

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
                  SignUpButton,
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}







