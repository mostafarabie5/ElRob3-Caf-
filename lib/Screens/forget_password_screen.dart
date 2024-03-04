import 'package:flutter/material.dart';
import 'package:magic_coffee/Components/custom_text_field.dart';
import 'package:magic_coffee/Components/floating_action_button.dart';
import 'package:magic_coffee/Screens/two_factor_verification.dart';
import 'package:magic_coffee/constants.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  static String id = 'ForgetPasswordScreen';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
            vertical: 50,
          ),
          child: ListView(
            children: [
              Text(
                'Forget Password?',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your email address',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC1C0C0),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                hintText: 'Email address',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                validator: (email) {
                  if (email!.isEmpty) return 'Invalid email';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.pushNamed(context, TwoFactorVerification.id);
        }
      }),
    );
  }
}
