import 'package:doe/screens/donation_screen/galery_pick_screen.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/widgets/hotel_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  final FirebaseUser user;
  final VoidCallback onSignedOut;

  const HomeScreen({Key key, @required this.user, this.onSignedOut}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.peopleCarry,
    FontAwesomeIcons.book,
    Icons.computer,
    FontAwesomeIcons.dog,
  ];

  void _signOut() async {
    try {
      var currentUser = await FirebaseService.currentUser();
      print('user $currentUser.email request signout');
      await FirebaseService.signout();
      widget.onSignedOut();
    } catch (e) {
      print(e.message);
    }
  }

  ImageProvider _getProfileImage(){
    if(widget.user == null){
      return AssetImage('assets/images/profile.jpg');
    }
    return NetworkImage(widget.user.photoUrl);

  }

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
        child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
          ),

      ),
    );
  }

  Future<void> _handleClick(int index){
    print('navigator buttom $index selected');
    setState(() => _currentTab = index);
    if(index == 0){//search icon
      
    }else if(index == 1){//camera
      Navigator.push(context, MaterialPageRoute(builder: (_) => GaleryPickImageScreen(user: widget.user,)));
    }else{//profile

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: _signOut,
            ),
        ],
      ),
      body: SafeArea(child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'What would you like to find?',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key)).toList(),
          ),
          SizedBox(height: 20.0,),
          DestinationCarousel(),
          SizedBox(height: 20.0,),
          HotelCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int index) => _handleClick(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.camera,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20.0,
              backgroundImage: _getProfileImage(),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}