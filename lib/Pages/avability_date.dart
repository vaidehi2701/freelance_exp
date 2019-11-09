import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

class AvaiblityDate extends StatefulWidget {
  AvaiblityDate() : super();

  @override
  AvaiblityDateState createState() => AvaiblityDateState();
}

class AvaiblityDateState extends State<AvaiblityDate> {

  DateTime startDate = DateTime.now();
  DateTime endDate= DateTime.now().add(new Duration(days: 7));


  Future date (BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: startDate,
        initialLastDate: endDate,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2023)
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        startDate = picked[0];
        endDate = picked[1];
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Date Selection'),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  await date(context);
                },
                child: Icon(Icons.add))
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Start Date',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text('End Date',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                  Text('Status',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(' ${DateFormat('dd/MM/yyyy').format(startDate).toString()}'),
                Text(' ${DateFormat('dd/MM/yyyy').format(endDate).toString()}'),
                Text('Avaiable'),

              ],
            ),
          ],
        ),
      ),

    );
}
}