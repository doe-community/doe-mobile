import 'package:doe/services/firebase_service.dart';
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
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  void _signOut() async {
    try {
      await FirebaseService.signout();
      widget.onSignedOut();
    } catch (e) {
      print(e.message);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () => _signOut,
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
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
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
              backgroundImage: NetworkImage('https://www.tupi.fm/wp-content/uploads/2019/08/Ronaldinho-Gaúcho.jpg'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}