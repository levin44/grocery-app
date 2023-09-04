import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/auth/signup.dart';
import 'package:grocery_app/screens/main/main_screen.dart';
import 'package:grocery_app/utils/helper/alert_helper.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  AuthController _authController = AuthController();

  final _email = TextEditingController();
  TextEditingController get email => _email;
  final _name = TextEditingController();
  TextEditingController get name => _name;
  final _password = TextEditingController();
  TextEditingController get password => _password;

  //validate text inputs
  bool validateFields(BuildContext context) {
    if (_name.text.isEmpty || _password.text.isEmpty || _email.text.isEmpty) {
      Logger().w("fill all");
      AlertHelper.showAlert(context, "fill all");
      return false;
    } else if (!_email.text.contains("@")) {
      Logger().w("please enter valid email");
      AlertHelper.showAlert(context, "enter valid email");
      return false;
    } else if (_password.text.length < 6) {
      Logger().w("password need 6 digits");
      AlertHelper.showAlert(context, "password need 6 digits");
      return false;
    } else {
      Logger().w("all good");
      return true;
    }
  }

  //loader state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //set loader state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> startSignup(BuildContext context) async {
    try {
      //validating the inputs
      if (validateFields(context)) {
        //start loader
        setLoading(true);
        await _authController
            .signupUser(context, _email.text, _password.text)
            .then(
          (value) {
            //stop the loader
            setLoading(false);
          },
        );
      }
    } catch (e) {
      Logger().e(e);
      setLoading(false);
      AlertHelper.showAlert(context, e.toString());
    }
  }

  //initialized the user and listen to the authstateChanges
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().w('User is currently signed out!');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signup()));
      } else {
        Logger().w('User is signed in!');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      }
    });
  }

  //signout function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
