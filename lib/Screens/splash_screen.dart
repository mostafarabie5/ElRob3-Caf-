import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'StartUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Startup photo.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 24,
            child: Image.asset('assets/images/Vector.png'),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 7,
            top: 320,
            child: const Text(
              'ElRob3 Cafe',
              style: TextStyle(
                fontFamily: 'ReenieBeanie',
                color: Colors.white,
                fontSize: 70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
