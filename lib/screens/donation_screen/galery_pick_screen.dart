import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;

import 'package:doe/models/donate_entity.dart';
import 'package:doe/screens/donation_screen/publish_screen.dart';
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
  final _formKey = GlobalKey<FormState>();
   String _title, _city, _additionalInfo;
   int _currentTab = 0;
   File _image;

  @override
  void initState() {
    super.initState();
    pickImage();
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

  Future _submit() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      String basename = '${DateTime.now().millisecondsSinceEpoch}_' + path.basename(_image.path);
      Donate donation = Donate(
                          title: _title,
                          city: _city,
                          additionalInfo: _additionalInfo,
                          imageUrl: basename,
                          date: Timestamp.now(),
                          user: widget.user.email
                        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PublishFormScreen(donation: donation, image: _image,)));
    }
  }

  _handleClick(int index){
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
            onTap: _submit,
              child: Text(
                'Publicar',
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
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1),
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(),
              ),
              child: (_image != null) ? Image.file(_image, fit: BoxFit.fill,) : Image.asset('assets/images/profile.jpg')
            ),
            SizedBox(height: 10,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Informações de doação',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Título',
                              icon: Icon(Icons.title),
                            ),
                            validator: (input) => input.trim().isEmpty
                                ? 'Favor informar o tipo de produto para doação!'
                                : null,
                            onSaved: (input) => _title = input.trim(),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Cidade',
                              icon: Icon(Icons.location_city),
                            ),
                            validator: (input) => input.trim().isEmpty
                                ? 'Favor informar o nome da cidade!'
                                : null,
                            onSaved: (input) => _city = input.trim(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0
                          ),
                          child: TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Informações adicionais',
                              icon: Icon(Icons.more),
                            ),
                            validator: (input) => input.trim().isEmpty
                                ? 'Favor fornecer informações adicionais a respeito da doação!'
                                : null,
                            onSaved: (input) => _additionalInfo = input.trim(),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            )
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
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fileImage,
              size: 30.0,
            ),
            title: Text('Galeria'),
          ),
        ],),
      
    );
  }
}