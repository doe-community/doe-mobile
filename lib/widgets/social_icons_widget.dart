import 'package:doe/screens/custom_icon.dart';
import 'package:doe/screens/social_icon.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {

  FirebaseUser _googleLogin(){
    FirebaseUser _user;
    try {
      FirebaseService.signInWithGoogleAccount()
      .then((FirebaseUser user) => _user =  user  
      ).catchError((onError) => print('Error signin using google.'));
    } catch (err) {
      print('Error login with google account. $err.code : $err.message');
    }
    return _user;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
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
                onPress: _googleLogin,
              ),
          ],
      );
  }
}