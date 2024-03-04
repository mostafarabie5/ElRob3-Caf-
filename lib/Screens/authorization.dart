import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Components/custom_text_field.dart';
import 'package:magic_coffee/Components/floating_action_button.dart';
import 'package:magic_coffee/Screens/forget_password_screen.dart';
import 'package:magic_coffee/Screens/menu_screen.dart';
import 'package:magic_coffee/Screens/registeration_screen.dart';
import 'package:magic_coffee/Screens/splash_screen.dart';
import 'package:magic_coffee/constants.dart';

import '../Cubits/Auth Cubit/auth_cubit.dart';

// ignore: must_be_immutable
class AuthorizationScreen extends StatelessWidget {
  AuthorizationScreen({super.key});
  static String id = 'AuthorizationScreen';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool userNotFound = false;
  bool wrongPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xFF384C5A),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
            vertical: 50,
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Text(
                  'Sign in',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFC1C0C0),
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  hintText: 'Email Address',
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  secure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid Email';
                    }
                    if (userNotFound) {
                      return 'No user found for that email.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  controller: passwordController,
                  secure: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid Password';
                    }
                    if (wrongPassword) {
                      return ' Wrong password provided for that user.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, ForgetPasswordScreen.id),
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFF384C5A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('New member? ',
                        style: TextStyle(
                          color: Color(0xFFC1C0C0),
                          fontSize: 18,
                        )),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, RegistrationScreen.id),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFF384C5A),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(onPressed: () async {
          if (formKey.currentState!.validate()) {
            try {
              final credential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
              BlocProvider.of<AuthCubit>(context).user = credential;
              Navigator.pushNamed(context, SplashScreen.id);
              Timer(const Duration(seconds: 3), () {
                Navigator.popAndPushNamed(context, MenuScreen.id,
                    arguments: credential);
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                userNotFound = true;
              } else if (e.code == 'wrong-password') {
                wrongPassword = true;
              }
              formKey.currentState!.validate();
              wrongPassword = false;
              userNotFound = false;
            }
          }
        }));
  }
}
