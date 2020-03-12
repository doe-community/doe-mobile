import 'package:doe/screens/login_screen.dart';
import 'package:doe/screens/root_screen.dart';
import 'package:doe/screens/signup_screen.dart';
import 'package:doe/widgets/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DoE',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor:  Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: RootPageScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomeScreen.id: (context) => HomeScreen(user: null),

      },
    );
  }
}