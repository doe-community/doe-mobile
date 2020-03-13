import 'package:doe/screens/login_screen.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/widgets/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootPageScreen extends StatefulWidget {

  FirebaseUser user;
  
  @override
  _RootPageScreenState createState() => _RootPageScreenState();
}

///User tracker enum. PS: This approach should be improved in the future
enum AuthStatus {
  signedOut,
  signedIn,
}

class _RootPageScreenState extends State<RootPageScreen> {

AuthStatus authStatus = AuthStatus.signedOut;

  @override
  void initState() {
    super.initState();
    FirebaseService.currentUser().then((userId) {
      setState(() {
        widget.user = userId;
        authStatus = (userId ==  null) ? AuthStatus.signedOut : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
        authStatus = AuthStatus.signedOut;
    });
  }
  

   
  @override
  Widget build(BuildContext context) {
    switch(authStatus) {
      case AuthStatus.signedOut: {
        return LoginScreen(
          onSignedIn: _signedIn,
        );
      }
      case AuthStatus.signedIn: {
        return HomeScreen(
          user: widget.user,
          onSignedOut: _signedOut,);
      }
      default: {
        return LoginScreen(
          onSignedIn: _signedIn,
        );
      }
    }
  }
}