import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';

class AuthController {
  //sign up user
  Future<void> signupUser(BuildContext context, email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        Logger().w("user created success");
      } else {
        Logger().w("couldnt create user");
      }
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, e.code);
    } catch (e) {
      AlertHelper.showAlert(context, e.toString());
    }
  }
}
