import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/assets_constants.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';

class AuthController {
  //sign up user
  Future<void> signupUser(
      BuildContext context, email, String password, String name) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        Logger().w("user created success");
        //if success save extra user data
        saveUserData(email, name, credential.user!.uid);
      } else {
        Logger().w("couldnt create user");
      }
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, e.code);
    } catch (e) {
      AlertHelper.showAlert(context, e.toString());
    }
  }

//create a collection referance called user
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //save extra user data in firestore
  Future<void> saveUserData(String email, String name, String uid) async {
    return users
        .doc(uid)
        .set({
          'uid': uid,
          'name': name,
          'email': email,
          'img': AssetsConstants.profileUrl,
        })
        .then((value) => Logger().i("user added"))
        .catchError((error) => Logger().e("failed to add user: $error"));
  }

//login user into the app
  Future<void> loginUser(BuildContext context, email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, e.code);
    } catch (e) {
      AlertHelper.showAlert(context, e.toString());
    }
  }

// send password reset email
  Future<void> sendEmail(BuildContext context, email) async {
    try {
      final credential = await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: email,
      )
          .then(
        (value) {
          AlertHelper.showAlert(context, "Email sent, check your inbox",
              type: DialogType.success);
        },
      );
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, e.code);
    } catch (e) {
      AlertHelper.showAlert(context, e.toString());
    }
  }
}
