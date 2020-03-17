import 'package:doe/screens/donation_screen/galery_pick_screen.dart';
import 'package:doe/screens/favorites/post_manager_screen.dart';
import 'package:doe/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavBar extends StatefulWidget {
  final FirebaseUser user;

  const HomeNavBar({ @required this.user });


  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
    int _currentTab = 0;

  _handleClick(int index){//Bottom navbar selection
    print('navigator buttom $index selected');
    setState(() => _currentTab = index);
    if(index == 0){//search icon
      
    }else if(index == 1){//camera
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => GaleryPickImageScreen(
          user: widget.user,
          )
        )
      );
    }else if(index == 2){//posts
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => PostManagerScreen(
          user: widget.user,
          )
        )
      );
    }else{//profile
      Navigator.push(context, CupertinoPageRoute(builder: (_) => ProfileScreen(user: widget.user,)));
    }
  }

  ImageProvider _getProfileImage(){
    if(widget.user != null && widget.user.photoUrl != null){
      return NetworkImage(widget.user.photoUrl);
    }else{
       return AssetImage('assets/images/profile.jpg',);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int index) => _handleClick(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 20.0,
              color: _currentTab == 0 ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.camera,
              size: 20.0,
              color: _currentTab == 1 ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
              size: 20.0,
              color: _currentTab == 2 ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20.0,
              backgroundImage: _getProfileImage(),
              backgroundColor: _currentTab == 0 ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      );
  }
}