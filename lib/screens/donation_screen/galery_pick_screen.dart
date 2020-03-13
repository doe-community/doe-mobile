import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class GaleryPickImageScreen extends StatefulWidget {

  final FirebaseUser user;
  

  const GaleryPickImageScreen({ this.user });



  @override
  _GaleryPickImageScreen createState() => _GaleryPickImageScreen();
}

class _GaleryPickImageScreen extends State<GaleryPickImageScreen> {
    int _currentTab = 0;
    File _image;

    @override
  void initState() {
    getImage();
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }


   Future<void> _handleClick(int index){
    print('navigator buttom $index selected');
    setState(() => _currentTab = index);
    if(index == 0){//search icon
      pickImage();
    }else if(index == 1){//galery
      getImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          GestureDetector(
            onTap: () => print('Next clicked!'),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
            ),
          )
        ],
      ),
      body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 1.0),
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(),
              ),
              child: (_image != null) ? Image.file(_image, fit: BoxFit.fill,) : Image.asset('assets/images/profile.jpg')),
            ], 
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int index) => _handleClick(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fileImage,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
        ],),
      
    );
  }
}