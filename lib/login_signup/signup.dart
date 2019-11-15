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

  @override
  Widget build(BuildContext context) {
    final FocusNode fnName = FocusNode();
    final FocusNode fnbDay = FocusNode();
    final FocusNode fnMobile = FocusNode();
    final FocusNode fnSecondMobile = FocusNode();
    final FocusNode fnEmail = FocusNode();
    final FocusNode fnSecondEmail = FocusNode();
    final FocusNode fnAddress = FocusNode();
    final FocusNode fnTempAddress = FocusNode();
    final FocusNode fnAdharCard = FocusNode();
    final FocusNode fnPanCard = FocusNode();
    final FocusNode fnAdharCardButton = FocusNode();
    final FocusNode fnPanCardButton = FocusNode();


    final NameWidget =
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: nameValidation,
      focusNode: fnName,
      onFieldSubmitted: (term) {
        fnName.unfocus();
        FocusScope.of(context).requestFocus(fnbDay);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Name',
          labelText: 'Name'
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
              hintText: 'Enter BirthDate',
              labelText: 'BirthDate',
            ),
            controller: birthdateValidation,
            focusNode: fnbDay,
            onFieldSubmitted: (term) {
              fnbDay.unfocus();
              FocusScope.of(context).requestFocus(fnMobile);
            },
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
      focusNode: fnMobile,
      onFieldSubmitted: (term) {
        fnMobile.unfocus();
        FocusScope.of(context).requestFocus(fnSecondMobile);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Primary Contact Number',
          labelText: 'Primary Contact Number'
      ),
      validator : validateMobile,
      onSaved: (val) => mobile=val,
    );

    final SecondaryNumberWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: secondMobileValidation,
      focusNode: fnSecondMobile,
      onFieldSubmitted: (term) {
        fnSecondMobile.unfocus();
        FocusScope.of(context).requestFocus(fnEmail);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Secondary Contact Number',
          labelText: 'Secondary Contact Number(Optional)'
      ),
      onSaved: (val) => secondMobile=val,
    );

    final PrimaryEmailWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: emailValidation,
      focusNode: fnEmail,
      onFieldSubmitted: (term) {
        fnEmail.unfocus();
        FocusScope.of(context).requestFocus(fnSecondEmail);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Primary Email',
          labelText: 'Primary Email'
      ),
      validator : validateMobile,
      onSaved: (val) => email=val,
    );

    final SecondaryEmailWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: secondEmailValidation,
      focusNode: fnSecondEmail,
      onFieldSubmitted: (term) {
        fnSecondEmail.unfocus();
        FocusScope.of(context).requestFocus(fnAddress);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Secondary Email',
          labelText: 'Secondary Email(Optional)'
      ),

      onSaved: (val) => secondEmail=val,
    );

    final PermanentAddressWidget= TextFormField(
      textInputAction: TextInputAction.next,
      controller: addressValidation,
      focusNode: fnAddress,
      onFieldSubmitted: (term) {
        fnAddress.unfocus();
        FocusScope.of(context).requestFocus(fnTempAddress);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Permanent Address',
          labelText: 'Permanent Address'
      ),
      validator : validateMobile,
      onSaved: (val) => address=val,
    );

    final TemporaryAddressWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: tempAddressValidation,
      focusNode: fnTempAddress,
      onFieldSubmitted: (term) {
        fnTempAddress.unfocus();
        FocusScope.of(context).requestFocus(fnAdharCard);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Temporary Address',
          labelText: 'Temporary Address'
      ),
      validator : validateMobile,
      onSaved: (val) => tempAddress=val,
    );

    final AdharCardWidget=
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: adharCardValidation,
      focusNode: fnAdharCard,
      onFieldSubmitted: (term) {
        fnAdharCard.unfocus();
        FocusScope.of(context).requestFocus(fnAdharCardButton);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Adhar Card Number',
          labelText: 'Adhar Card Number'
      ),
      validator : validateMobile,
      onSaved: (val) => adharCard=val,
    );

    final PanCardWidget =
    TextFormField(
      textInputAction: TextInputAction.done,
      controller: panCardValidation,
      focusNode: fnPanCard,
      onFieldSubmitted: (term) {
        fnPanCard.unfocus();
        FocusScope.of(context).requestFocus(fnPanCardButton);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your PAN Card Number',
          labelText: 'PAN Card Number'
      ),
      validator : validateMobile,
      onSaved: (val) => panCard=val,
    );

    final SignUpButton=
    Container(
      child: RaisedButton(
        focusNode: fnName,
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
              padding: const EdgeInsets.only(left: 30 , right: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 55),
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
                            padding: const EdgeInsets.all(25.0),
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
                                    Text("Upload Adhar Card:"),
                                    SizedBox(width: 15),

                                    RaisedButton(
                                      onPressed: (){
                                        showAlertDialog(context);
                                      },
                                      focusNode: fnAdharCardButton,
                                      child: Text('Upload'),
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
                                    Text("Upload PAN Card:"),
                                    SizedBox(width: 15),
                                    RaisedButton(
                                      onPressed: () {
                                        showAlertDialog(context);
                                      },
                                      focusNode: fnPanCardButton,
                                      child: Text('Upload'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SignUpButton
                      ),
                    ],
                  ),
                  Image.asset('images/image_02.png')
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}







