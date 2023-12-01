import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  //show a dialog
  static void showAlert(BuildContext context, String desc,
      {DialogType type = DialogType.error}) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.rightSlide,
      title: type == DialogType.success ? "Success" : 'Error',
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

//show snakbar
  static void showSnakBar(BuildContext context, String msg,
      {AnimatedSnackBarType type = AnimatedSnackBarType.error}) {
    AnimatedSnackBar.material(
      msg,
      type: type,
      duration: Duration(seconds: 2),
    ).show(context);
  }
}
