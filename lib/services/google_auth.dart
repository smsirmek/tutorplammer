import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}

// class GoogleSignInProvider extends ChangeNotifier{

// final googleSignIn = GoogleSignIn();

//       GoogleSignInAccount? _user;

//       GoogleSignInAccount get user =>_user!;

// Future googleLogin() async {
//     final googleUser = await googleSignIn.signIn();
//     if(googleUser == null) return ;
//       _user = googleUser ;

//     final googleAuth = await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       idToken: googleAuth.idToken,
//       accessToken: googleAuth.accessToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);

//  notifyListeners();
// }

//   Future<void> signOut() async{
//     final googleSignIn = GoogleSignIn();
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }

// }