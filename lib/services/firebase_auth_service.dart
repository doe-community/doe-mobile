
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
    static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    static final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );

  static Future<FirebaseUser> signInWithEmailAndPassword(String _email, String _password) async{
        AuthResult response = await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

  static Future<FirebaseUser> registerUser(String _email, String _password) async{
    AuthResult response = await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
    return response.user;    
  }

  static Future<FirebaseUser> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  static Future<void> signout() async{
    await _firebaseAuth.signOut();
  }

  static Future<FirebaseUser> signInWithGoogleAccount() async{
    GoogleSignInAccount googleUser = await _googleSignIn.signIn(); 

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  static void googleSignOut() async {
    print('google signout.');
    await _googleSignIn.signOut();
  }

  static Future<GoogleSignInAccount> deleteAccount() async {
    print('firebase disconnect user.');
    return await _googleSignIn.disconnect();
  }

}