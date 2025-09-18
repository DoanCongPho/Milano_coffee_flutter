import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class FacebookSignInProvider with ChangeNotifier {
  User? user;
  


  Future<void> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
  
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.token;

        final credential = FacebookAuthProvider.credential(accessToken);

        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );

        user = userCredential.user;
        notifyListeners(); // tells UI to rebuild if using Consumer or watch
      } else {
        print('Facebook login failed: ${result.status}');
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  }

  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    user = null;
    notifyListeners();
  }
}
