import 'package:doe/screens/custom_icon.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/widgets/home/home_screen.dart';
import 'package:doe/widgets/social_icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  final VoidCallback onSignedIn;
  SocialIcons({ @required this.onSignedIn });


  void _googleLogin(BuildContext context) async {
    print('google sign in press by user.');
    try {
      FirebaseUser user = await FirebaseService.signInWithGoogleAccount();
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen(user: user, onSignedOut: onSignedIn,)));
      }
    } catch (err) {
      print('Error signin using google.');
      print('Error login with google account. ${err.code} : ${err.message}');
    }
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
            onPress: () => print('facebook signin pressed!'),
          ),
          SocialIcon(
            colors: [
                Color(0xFFff4f38),
                Color(0xFFff355d),
              ],
            iconData: CustomIcons.google,
            onPress: () => _googleLogin(context),//_googleLogin,
          ),
        ],
      );
  }
}