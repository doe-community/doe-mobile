import 'package:doe/screens/login/login_screen.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/utils/toast_utils.dart';
import 'package:doe/widgets/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootPageScreen extends StatefulWidget {
  
  @override
  _RootPageScreenState createState() => _RootPageScreenState();
}

///User tracker enum. PS: This approach should be improved in the future
enum AuthStatus {
  signedOut,
  signedIn,
}

class _RootPageScreenState extends State<RootPageScreen> {
FirebaseUser _user;
AuthStatus authStatus = AuthStatus.signedOut;

  @override
  void initState() {
    super.initState();
    FirebaseService.currentUser()
    .then((userId) {
      _user = userId;
      setState(() {
        authStatus = (userId ==  null) ? AuthStatus.signedOut : AuthStatus.signedIn;
       });
      }
    ).catchError((error) => ToastUtils.showError('Erro! $error.code : $error.message'));
  }

  void _signedIn(){
    setState(() =>authStatus = AuthStatus.signedIn);
  }

  void _signedOut(){
    setState(() => authStatus = AuthStatus.signedOut);
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
          user: _user,
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