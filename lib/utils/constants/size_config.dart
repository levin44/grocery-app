import 'package:flutter/material.dart';

class SizeConfig {
//get screen height
  static double h(BuildContext c) => MediaQuery.of(c).size.height;

  static double w(BuildContext c) => MediaQuery.of(c).size.width;
}
