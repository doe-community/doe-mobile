
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
    static final FirebaseAuth _instance = FirebaseAuth.instance;

  static Future<FirebaseUser> signInWithEmailAndPassword(String _email, String _password) async{
        AuthResult response = await _instance.signInWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

  static Future<FirebaseUser> registerUser(String _email, String _password) async{
    AuthResult response = await _instance.createUserWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

  static Future<FirebaseUser> currentUser() async {
    FirebaseUser user = await _instance.currentUser();
    return user;
  }

  static Future<void> signout() async{
    await _instance.signOut();
  }

}