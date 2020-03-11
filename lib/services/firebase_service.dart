import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  static Future<FirebaseUser> signInWithEmailAndPassword(String _email, String _password) async{
    AuthResult response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

  static Future<FirebaseUser> registerUser(String _email, String _password) async{
    AuthResult response = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

}