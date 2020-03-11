import 'package:doe/screens/custom_icon.dart';
import 'package:doe/screens/signup_screen.dart';
import 'package:doe/screens/social_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  String email, password;

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('Form validated with sucess! $email/$password');
      //Loggin in the home
    }
  }

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: 50,
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      validator: (input) => !input.contains('@')
                          ? 'Please enter a valid email!'
                          : null,
                      onSaved: (input) => email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock)
                      ),
                      validator: (input) => input.length < 4
                          ? 'Password must be at least 6 characters!'
                          : null,
                      onSaved: (input) => password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Divider(
                    height: 60.0,
                    color: Colors.grey[600],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.0
                        ),

                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                  SizedBox(height: 100.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        'Social Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      horizontalLine(),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPress: (){},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.google,
                        onPress: (){},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPress: (){},
                      ),
                    ],
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
