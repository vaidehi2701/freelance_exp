import 'package:flutter/material.dart';

class AddSkill extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checked Listview',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Checked Listview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<bool> inputs = new List<bool>();
  @override
  void initState() {
    setState(() {
      for(int i=0;i<10;i++){
        inputs.add(false);
      }
    });
  }

  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Skill'),
      ),
      
      body:  Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: inputs.length,
              itemBuilder: (BuildContext context, int index){
                return new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: new Column(
                      children: <Widget>[
                        new CheckboxListTile(
                            value: inputs[index],
                            title: new Text('item ${index}'),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged:(bool val){ItemChange(val, index);
                            }
                        ),
                      ],
                    ),
                  ),

                );
              }
          ),
          Align(
            alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: (){
                  Navigator.pop(context);
                  },
                  child: Icon(Icons.done)
                ),
              ),
          ),
        ],
      ),
    );
  }
}