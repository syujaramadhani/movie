import 'package:flutter/material.dart';
import 'package:movie/screens/menutabscreen.dart';

class Navigation {
  //BUYER
  static toBeranda(context, {tab = 0}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MenuTab(tab),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
