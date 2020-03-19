import 'package:doe/screens/categories/general_post.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:doe/widgets/home/bottom_navbar.dart';
import 'package:doe/widgets/samples/hotel_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../samples/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  final FirebaseUser user;
  final VoidCallback onSignedOut;

  const HomeScreen({ @required this.user, this.onSignedOut });


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.peopleCarry,
    FontAwesomeIcons.book,
    Icons.computer,
    FontAwesomeIcons.dog,
  ];

  @override
  void initState() {
    super.initState();
  }

  _handleSelection(int index){//header selection. TODO: (Bad smell code) Use Map or create oject to handle this code
    setState(() =>_selectedIndex = index);
    if(index == 1){//general selected
    _nagivate(title: 'Perto de você', category: 'all');
    }
    if(index == 2){//book selected
      _nagivate(title: 'Livros', category: 'book');
    }

    if(index == 3){//devices selected
    _nagivate(title: 'Eletronicos', category: 'electronic');
    }

    if(index == 4){//animal selected
    _nagivate(title: 'Animais', category: 'animal');
    }
  }

  _nagivate({String title, String category}){
    Navigator.push(context, MaterialPageRoute(builder: (_) => 
          GeneralPostScreen(
            databaseService: FireBaseDatabaseServiceImpl(), 
            category: category,
            title: title,
            ),
          ),
        );
  }
  
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: () => _handleSelection(index),
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Como podemos te ajudar?',
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
            SizedBox(height: 10.0,),
            DestinationCarousel(),
            SizedBox(height: 10.0,),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(user: widget.user,),
    );
  }
}