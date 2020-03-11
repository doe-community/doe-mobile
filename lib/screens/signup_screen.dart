import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name;

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('Form validated with sucess! $name/$email/$password');
      //Loggin in the home
    }
  }

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
                fontSize: 50.0,
                fontFamily: 'DancingScript'
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
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage('https://www.thispersondoesnotexist.com/image'),
                        //child: Text('image.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        icon: Icon(Icons.person),
                      ),
                      validator: (input) => input.trim().isEmpty
                          ? 'Please enter a valid user name!'
                          : null,
                      onSaved: (input) => name = input,
                    ),
                  ),
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
                        icon: Icon(Icons.lock),
                      ),
                      validator: (input) => input.length < 4
                          ? 'Password must be at least 6 characters!'
                          : null,
                      onSaved: (input) => password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Back to login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
