import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AdminNotiList extends StatefulWidget {
  @override
  _AdminNotiListState createState() => _AdminNotiListState();
}

class _AdminNotiListState extends State<AdminNotiList> {


  final List<String> titles = <String>['Requirement For Hardware Engineer fduyfyusdb ',
    'Requirement For Softare Engineer', 'Urgent Plumber Required',
    'Requirement For Hardware Engineer'];
  final List<String> details = <String>['job1 Details is here ',
    'Details U Require', 'What U ELSE wANT','Bio data Of Job'];
  final List<String> date = <String>['25-10-19', '15-10-19', '29-12-19','25-10-19'];
  final List<int> colorCodes = <int>[600, 500, 100];

  

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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Notification',style: TextStyle(
                    color: Colors.black
                ),),
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/addNotification');
                    },
                    child: Icon(Icons.add))
              ],
            ),
          ),
          body:ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Slidable(
                      actionPane: SlidableStrechActionPane (),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder:(BuildContext context){
                                  return AlertDialog(
                                    title: Text('${titles[index]}'),
                                    content: Container(
                                      height: 55,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(' ${details[index]}'),
                                          SizedBox(height: 10),
                                          Text('Last Date : ${date[index]}' , style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),)
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        children: <Widget>[
//                                            FlatButton(
//                                              onPressed: (){
//                                                Navigator.pushNamed(context, '/Home');
//                                              },
//                                              child: Text('Apply'),
//                                            ),
                                          FlatButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('close'),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${titles[index]}' ,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18
                                        ),),
                                      SizedBox(height: 10),
                                      Text('Last Date : ${date[index]}' , style: TextStyle(
                                          fontSize: 15
                                      ),),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_left,color: Colors.grey,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Edit',
                          color: Colors.black45,
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              titles.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),


                );
              }
          ),
        ),

      ],
    );

  }
}
