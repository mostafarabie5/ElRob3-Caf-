import 'package:flutter/material.dart';
import 'package:magic_coffee/Components/floating_action_button.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/otp.dart';

class TwoFactorVerification extends StatelessWidget {
  const TwoFactorVerification({super.key});
  static String id = 'TwoFactorVerification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: mainColor,
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(onPressed: () {
          //Navigator.pushNamed(context, AuthorizationScreen.id);
        }),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
            vertical: 50,
          ),
          child: ListView(
            children: [
              Text(
                'Verification',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter the OTP code we sent you',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC1C0C0),
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                children: [
                  otpBox(),
                  SizedBox(width: 10),
                  otpBox(),
                  SizedBox(width: 10),
                  otpBox(),
                  SizedBox(width: 10),
                  otpBox(),
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Resend in 00:30',
                style: TextStyle(
                  color: Color(0xFFC1C0C0),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
