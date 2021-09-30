import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



// ignore: camel_case_types
class googleAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<User?> signInWithGoogle() async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      final googleAuth = await googleUser.authentication;
      
      if(googleAuth.idToken != null){
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,)
          );
          return userCredential.user;
      }
    }else{
      throw FirebaseAuthException(
        message: "Sign in aborded user",
        code:  "ERROR"
      );
    }
   }

  Future<User?> signOut() async{
    await FirebaseAuth.instance.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.disconnect();
    

  }
}
