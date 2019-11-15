import 'package:flutter/material.dart';

class AdminList extends StatefulWidget {
  @override
  _AdminListState createState() => _AdminListState();
}


class _AdminListState extends State<AdminList> {

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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Admin List',
                      style:ToolbarTitle),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context,'/addAdmin');
                      },
                      child: Icon(Icons.add))
                ],
              ),
            ),
            body:GridView.count(
                crossAxisCount: 2,
                children: List.generate(admins.length, (index) {
                  return Center(
                    child: AdminInfoWidget(admin: admins[index]),
                  );
                }
                )
            )
        ),

      ],
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
                    height: 109,
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
                      color: Colors.red,
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(admin.title,style: TextStyle(
                                    fontFamily: 'SEGOEUI',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                            ),
                            PopupMenuButton(
                              icon: Icon(Icons.more_vert,color: Colors.white,),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/addAdmin');
                                    },
                                    child :Row(
                                      children: <Widget>[
                                        Icon(Icons.mode_edit,size: 20,),
                                        SizedBox(width: 10),
                                        Text(
                                          "Edit",style:TextStyle(
                                            fontFamily: 'SEGOEUI',
                                            fontSize: 16,

                                            fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),)
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    child :Row(
                                      children: <Widget>[
                                        Icon(Icons.delete,size: 20,),
                                        SizedBox(width: 10),
                                        Text(
                                          "Delete",style:TextStyle(
                                            fontFamily: 'SEGOEUI',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),
                                  ),
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