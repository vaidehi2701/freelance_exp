import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddAdmin extends StatefulWidget {
  @override
  _AddAdminPageState createState() => new _AddAdminPageState();
}

class _AddAdminPageState extends State<AddAdmin> {

  bool isSwitched = false;
  File image;

  ChooseGallery()async{
    File img =await ImagePicker.pickImage(source: ImageSource.gallery);
    if(img != null){
      print(img.path);
      setState(() {
        image=img;
        Navigator.of(context).pop();
      });

    }
  }
  ChooseCamera()async{
    File img =await ImagePicker.pickImage(source: ImageSource.camera);
    if(img != null){
      print(img.path);
      setState(() {
        image=img;
        Navigator.of(context).pop();
      });

    }
  }

  showAlertDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: Column(
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

  Widget getProfilePicture({String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 150.0,
        height: 150.0,
        child: Stack(
            children: [
              getImage(),
              image == null ?_getPlusIcon() : Container()
            ]
        )
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      left: 95,
      top: 100,
      child: Container(
          width: 35, // PlusIconSize = 20.0;
          height: 35, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: GestureDetector(
            onTap: (){
              showAlertDialog(context);
            },
            child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0
            ),
          )),);
  }
  Widget getImage() {
    return Positioned(
        child: Container(
          padding: EdgeInsets.all(1.0),
          decoration: BoxDecoration(

          ),
          child:Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: image == null  ? AssetImage('images/noprofile.jpg') : FileImage(image),
                     // image: FileImage(image)
                  ),

                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(blurRadius: 5.0, color: Colors.black)
                  ]
              )
          ),
        )
    );
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
              image: new AssetImage("images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title:Text(
              "Add Admin",
              style: ToolbarTitle,
            ),
          ),

          backgroundColor: Colors.transparent,
          body:Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                    color: Colors.black.withOpacity(0.6)),
                clipper: getClipper(),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getProfilePicture(),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:'Admin Id',labelStyle: Title
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password', labelStyle: Title
                      ),
                    ),
                  ),

                  SizedBox(height: 35.0),
                  Container(
                      height: 45.0,
                      width: 145.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.red,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.7,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )),

                ],
              )

            ],
          ),
        ),

      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.2);
    path.lineTo(size.width + 95, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }
}