import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:async';
import 'package:intl/intl.dart';


class AddJobDetail extends StatefulWidget {
  @override
  _AddJobDetailState createState() => _AddJobDetailState();
}

class _AddJobDetailState extends State<AddJobDetail> {

  final job_title1 =   new TextEditingController();
  final job_title2 =   new TextEditingController();
  final start_date =   new TextEditingController();
  final end_date =   new TextEditingController();
  final working_days =   new TextEditingController();
  final hour_of_week =   new TextEditingController();
  final sunday_avaiblity =   new TextEditingController();
  final payment_terms =   new TextEditingController();
  final job_location =   new TextEditingController();
  final accommodation =   new TextEditingController();
  final one_time_transpotaion =   new TextEditingController();
  final local_transpotation =   new TextEditingController();
  final reg_hour_rate =   new TextEditingController();
  final overtime_hour_rate =   new TextEditingController();


  Future ChooseStartDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;

    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2020));

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
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
            title:  Text(
              "Job Details",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body:   Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.title),
                          labelText: 'Job Title 1'
                      ),
                      controller: job_title1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.title),
                          labelText:'Job Title 2'
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: new TextFormField(
                            decoration: new InputDecoration(
                              icon: Icon(Icons.date_range),
                              hintText: 'Enter starting date',
                              labelText: 'Start Date',
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
                              hintText: 'Enter Ending Date',
                              labelText: 'End Date',
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
                          icon: Icon(Icons.date_range),
                          labelText: 'Working Days In Week'
                      ),
                      controller: working_days,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.date_range),
                          labelText: 'Hour Of Week'
                      ),
                      controller: hour_of_week,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.event_available),
                          labelText: 'Sunday Working Avability'
                      ),
                      controller: sunday_avaiblity,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.credit_card),
                          labelText: 'Payment Terms'
                      ),
                      controller: payment_terms,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_city),
                          labelText: 'Job Location'
                      ),
                      controller: job_location,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.hotel),
                          labelText: 'Accommodation Avaiblity'
                      ),
                      controller: accommodation,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.directions_car),
                          labelText: 'One Time Transporation'
                      ),
                      controller: one_time_transpotaion,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.directions_bus),
                          labelText: 'Local Transportaion'
                      ),
                      controller: local_transpotation,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.attach_money),
                          labelText: 'Regular Working Hour Day Rate'
                      ),
                      controller: reg_hour_rate,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.attach_money),
                          labelText: 'OverTime Working Hour Rate Per Hour'
                      ),
                      controller: overtime_hour_rate,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Center(
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text('Add Job',style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                                ),))
                        ),
                      ),
                    ),
                  ],
                ),

              )
          ),
        ),

      ],
    );
  }
}
