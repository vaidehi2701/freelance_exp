import 'package:flutter/material.dart';

class AdminList extends StatefulWidget {
  @override
  _AdminListState createState() => _AdminListState();
}


class _AdminListState extends State<AdminList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
               title: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text('Admin List'),
                   GestureDetector(
                       onTap: (){
                         Navigator.pushNamed(context,'/addAdmin');
                       },
                       child: Icon(Icons.add))
                 ],
               ),
        ),
            body: GridView.count(
                crossAxisCount: 2,
                children: List.generate(admins.length, (index) {
                  return Center(
                    child: AdminInfoWidget(admin: admins[index]),
                  );
                }
                )
            )
        )
    );
  }
}

class Admin {
  final String title;
  final String image;

  const Admin({this.title, this.image});
}

const List<Admin> admins = const <Admin>[
  const Admin(title: 'Mr.bajaj', image: 'images/1.jpg'),
  const Admin(title: 'Mr. Amit patel', image: 'images/2.jpg'),
  const Admin(title: 'Mrs. shah', image: 'images/3.jpg'),


];

class AdminInfoWidget extends StatelessWidget {
  const AdminInfoWidget({Key key, this.admin}) : super(key: key);
  final Admin admin;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 135,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: admin.image== null  ? AssetImage('images/noprofile.jpg') : AssetImage(admin.image),
                            // image: FileImage(image)
                          ),

                          borderRadius: BorderRadius.only(
                            topLeft:  Radius.circular(5.0),
                            topRight:  Radius.circular(5.0),
                          ),

                      )
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft:  Radius.circular(5.0),
                        bottomRight:  Radius.circular(5.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(admin.title,style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5
                              ),),
                            ),
                            PopupMenuButton(
                              icon: Icon(Icons.more_vert,color: Colors.white,),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/addAdmin');
                                    },
                                      child: Text('Edit')),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                      child: Text('Delete')),
                                )
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }
}