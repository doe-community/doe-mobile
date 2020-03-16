import 'package:doe/screens/profile/account_widget.dart';
import 'package:doe/screens/profile/help_widget.dart';
import 'package:doe/screens/profile/invite_friend_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final FirebaseUser user;

  const ProfileScreen({ this.user });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ImageProvider _getProfileImage(){
    if(widget.user != null && widget.user.photoUrl != null){
      return NetworkImage(widget.user.photoUrl);
    }else{
       return AssetImage('assets/images/profile.jpg',);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _getProfileImage(),
                ),
                SizedBox(width: 10.0,),
                Text(
                  widget.user.displayName,
                ),
                Text(
                  widget.user.email,
                  style: TextStyle(

                  )
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10.0,),
          AccountItem(),
          SizedBox(height: 30.0,),
          HelpItem(),
          SizedBox(height: 30.0,),
          InviteItem(),
        ],
      ),
    );
  }
}