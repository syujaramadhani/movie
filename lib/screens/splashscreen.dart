import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/routes/utils/navigations.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/menutabscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startSplashScreen();
    super.initState();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const MenuTab(0);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/splash.jpg",
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Movie",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
