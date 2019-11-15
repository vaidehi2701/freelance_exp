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
   String Add;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
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
            title:  Text(
              "Job Details",
              style: ToolbarTitle,
            ),
          ),
          body:   Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                           Expanded(
                             child: TextFormField(
                               textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.title),
                                        labelText: 'Job Title 1',labelStyle: Title
                                    ),
                                    controller: job_title1,
                                  ),
                           ),
                            
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      Add='one';
                                    });
                                  },
                                  child: Icon(Icons.add)),
                            ),

                          ],
                        ),

                        Add == 'one' ?
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              icon: Icon(Icons.title),
                              labelText:'Job Title 2',
                              labelStyle: Title
                          ),
                        ) : Container(),

                        Row(children: <Widget>[
                          Expanded(
                              child: new TextFormField(
                                textInputAction: TextInputAction.next,
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
                                textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number ,
                          decoration: InputDecoration(
                              icon: Icon(Icons.date_range),
                              labelText: 'Working Days In Week',labelStyle: Title
                          ),
                          controller: working_days,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number ,
                          decoration: InputDecoration(
                              icon: Icon(Icons.date_range),
                              labelText: 'Hour Of Week',labelStyle: Title
                          ),
                          controller: hour_of_week,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.event_available),
                              labelText: 'Sunday Working Avability',labelStyle: Title
                          ),
                          controller: sunday_avaiblity,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.credit_card),
                              labelText: 'Payment Terms',labelStyle: Title
                          ),
                          controller: payment_terms,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.location_city),
                              labelText: 'Job Location',labelStyle: Title
                          ),
                          controller: job_location,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.hotel),
                              labelText: 'Accommodation Avaiblity',labelStyle: Title
                          ),
                          controller: accommodation,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.directions_car),
                              labelText: 'One Time Transporation',labelStyle: Title
                          ),
                          controller: one_time_transpotaion,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.directions_bus),
                              labelText: 'Local Transportaion',labelStyle: Title
                          ),
                          controller: local_transpotation,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number ,
                          decoration: InputDecoration(
                              icon: Icon(Icons.attach_money),
                              labelText: 'Regular Working Hour Day Rate',labelStyle: Title
                          ),
                          controller: reg_hour_rate,
                        ),

                        TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number ,
                          decoration: InputDecoration(
                              icon: Icon(Icons.attach_money),
                              labelText: 'OverTime Working Hour Rate Per Hour',labelStyle: Title
                          ),
                          controller: overtime_hour_rate,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 10),
                          child: Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),

                            child: Center(
                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Add Job',style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                        fontSize: 18,
                                        color: Colors.white
                                    ),))
                            ),
                          ),
                        ),
                      ],
                    ),

                  )
              ),
            ),
          ),
        ),

      ],
    );
  }
}
