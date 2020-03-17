import 'package:doe/screens/login/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'social_icons_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';
  final VoidCallback onSignedIn;

  const LoginScreen({Key key, this.onSignedIn});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'DoE',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 50.0,
                ),
              ),
              LoginForm(onSignedIn: widget.onSignedIn,),
              SizedBox(height: 20.0),
              SocialIcons(onSignedIn: widget.onSignedIn),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New User ? ',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, SignupScreen.id),
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Color(0xFF5d74e3),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ],
      ),
    );
  }
}
