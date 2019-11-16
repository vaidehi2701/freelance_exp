import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:async';
import 'package:intl/intl.dart';


class AddWorkExperience extends StatefulWidget {
  @override
  _AddWorkExperienceState createState() => _AddWorkExperienceState();
}

class _AddWorkExperienceState extends State<AddWorkExperience> {


  final start_date =   new TextEditingController();
  final end_date =   new TextEditingController();
  final client_name =   new TextEditingController();
  final job_title =   new TextEditingController();
  final job_type =   new TextEditingController();
  final scope_work =   new TextEditingController();
  final standard_followed =   new TextEditingController();
  final chip= TextEditingController();


  Future ChooseStartDate(BuildContext context, String initialDateString) async {
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
      start_date.text = new DateFormat.yMd().format(result);
    });
  }

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
      end_date.text = new DateFormat.yMd().format(result);
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
    return Stack(
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
              title: Text("Add Work Experience",style:ToolbarTitle),
            ),
            body:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.title),
                              labelText: 'Job Title',labelStyle: Title
                          ),
                          controller: job_title,
                        ),

                        Row(children: <Widget>[
                          Expanded(
                              child: new TextFormField(
                                decoration: new InputDecoration(
                                  icon: Icon(Icons.date_range),
                                  labelText: 'Start Date',labelStyle: Title
                                ),
                                controller: start_date,
                                keyboardType: TextInputType.datetime,
                              )),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                              icon: new Icon(Icons.arrow_drop_down,size: 25,textDirection: prefix0.TextDirection.ltr,),
                              tooltip: 'Choose date',
                              onPressed: (() {
                                ChooseStartDate(context, start_date.text);
                              }),
                            ),
                          ),

                        ]),
                        Row(children: <Widget>[
                          Expanded(
                              child: new TextFormField(
                                decoration: new InputDecoration(
                                  icon: Icon(Icons.date_range),
                                  labelText: 'End Date',labelStyle: Title
                                ),
                                controller: end_date,
                                keyboardType: TextInputType.datetime,
                              )),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                              icon: new Icon(Icons.arrow_drop_down,size: 25,textDirection: prefix0.TextDirection.ltr,),
                              tooltip: 'Choose date',
                              onPressed: (() {
                                ChooseEndDate(context, end_date.text);
                              }),
                            ),
                          ),

                        ]),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.supervised_user_circle),
                              labelText: 'Client',labelStyle: Title
                          ),
                          controller: client_name,
                        ),


                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.account_balance),
                              labelText: 'Job Type',labelStyle: Title
                          ),
                          controller: job_type,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.account_balance),
                              labelText: 'Scope Of Work',labelStyle: Title
                          ),
                          controller: scope_work,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.account_balance),
                              labelText: 'Standards Followed',labelStyle: Title
                          ),
                          controller: standard_followed,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
//                    var route = new MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                      new Home_Page(
//                        company: company_name.text,
//                        project: project_name.text,
//                        start: start_date.text,
//                        end: end_date.text,
//                        position: position.text,
//                        field: field.text,
//                        detail: project_details.text,
//                      ),
//                    );
//                    Navigator.of(context).push(route);
                              },
                              color: Colors.red,
                              child: Text('Save Work Experience',style: TextStyle(
                                  fontFamily: 'SEGOEUI',
                                  fontSize: 17,
                                  letterSpacing: 0.7,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),

      ],
    );
  }
}




