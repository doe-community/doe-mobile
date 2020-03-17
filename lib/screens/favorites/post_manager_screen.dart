import 'package:doe/screens/favorites/donation_liked_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'donation_view_tab.dart';

class PostManagerScreen extends StatelessWidget {
  final FirebaseUser user;

  const PostManagerScreen({ this.user });

  @override
  Widget build(BuildContext context) {
      List<String> menuItems = [
        'Minhas doações',
        'Doações solicitadas'
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: menuItems.length, 
        child: Scaffold(          
          appBar: AppBar(
            title: Text(
              'Minha página'
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add_circle_outline),
                  text: menuItems.first,
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.heart),
                  text: menuItems.last,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DonationViewTab(userId: user.email),
              DonationLikedTab(userId: user.email),
            ],
          ),
        ),
      ),
    );
  }
}