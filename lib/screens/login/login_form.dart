import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/utils/toast_utils.dart';
import 'package:doe/widgets/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  final VoidCallback onSignedIn;

  const LoginForm({ @required this.onSignedIn });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: 50,
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  _submit() async {
    print('user click in login button.');
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('User with email: $_email and pass: $_password is trying to login.');
      //Loggin in the home
      try {
        print('user $_email logged sucessfuly.');
        FirebaseUser _user = await FirebaseService.signInWithEmailAndPassword(_email, _password);
        Navigator.push(context, 
        MaterialPageRoute(builder: (_) => HomeScreen(
          user: _user, 
          onSignedOut: widget.onSignedIn,
          )
        )); 
      }catch (e) {
        ToastUtils.showError(e.message);
        _formKey.currentState.reset();
        print('Error on firebase authentication using email and password. code: ${e.code} : ${e.message}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Form(
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
                        onSaved: (input) => _email = input.trim(),
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
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Divider(
                      height: 30.0,
                      color: Colors.grey[600],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forgot password ?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13.0,
                            decoration: TextDecoration.underline,
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
                          )
                      )
                    ),
                    SizedBox(height: 50.0,),
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

                  ],
                )
              );
              
  }
}