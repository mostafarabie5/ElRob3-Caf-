import 'package:flutter/material.dart';
import 'package:magic_coffee/Components/floating_action_button.dart';
import 'package:magic_coffee/Screens/authorization.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String id = 'WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 100),
                color: Color(0xFF384C5A),
                height: 400,
                width: double.infinity,
                child: const Text(''),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Image.asset('assets/images/Vector.png'),
              ),
              const Positioned(
                top: 360,
                left: 65,
                child: Text('ElRob3 Cafe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontFamily: 'ReenieBeanie',
                    )),
              )
            ]),
            const SizedBox(height: 50),
            const Text(
              'Feel Yourself like\na barista!',
              style: TextStyle(
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Magic coffee on order.',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFCECECE),
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
            onPressed: () =>
                Navigator.pushNamed(context, AuthorizationScreen.id)));
  }
}
