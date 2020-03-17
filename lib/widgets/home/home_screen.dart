import 'package:doe/screens/categories/general_post.dart';
import 'package:doe/screens/donation_screen/galery_pick_screen.dart';
import 'package:doe/screens/favorites/post_manager_screen.dart';
import 'package:doe/screens/profile/profile_screen.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:doe/widgets/hotel_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../destination_carousel.dart';

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
  int _currentTab = 0;

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

  void _signOut() async {
    try {
      var currentUser = await FirebaseService.currentUser();
      print('user $currentUser.email request signout');
      FirebaseService.signout();
      widget.onSignedOut();
      Navigator.pop(context);
    } catch (e) {
      print(e.message);
    }
  }

  _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
        title: Text('Sair'),
        content: Text('Deseja realmente sair ?'),
        actions: <Widget>[
          Row(
            children: <Widget>[              
              FlatButton(
                onPressed: () => Navigator.pop(context), 
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed:(){
                  Navigator.pop(context);
                  _signOut();
                }, 
                child: Text('Confirmar'),
              ),
            ],
          ),
        ],
      );
     }
    );
  }

  ImageProvider _getProfileImage(){
    if(widget.user != null && widget.user.photoUrl != null){
      return NetworkImage(widget.user.photoUrl);
    }else{
       return AssetImage('assets/images/profile.jpg',);
    }
    
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
            )
          )
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
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}