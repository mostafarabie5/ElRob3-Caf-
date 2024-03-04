import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Components/custom_text_field.dart';
import 'package:magic_coffee/Components/floating_action_button.dart';
import 'package:magic_coffee/Cubits/Auth%20Cubit/auth_cubit.dart';
import 'package:magic_coffee/constants.dart';
import 'menu_screen.dart';
import 'splash_screen.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  static String id = 'RegistrationScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool emailExist = false;
  bool weakPassword = false;

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
                'Sign up',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Create an account here',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC1C0C0),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                hintText: 'Name',
                prefixIcon: Icons.person_outlined,
                controller: nameController,
                type: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) return 'Invalid Name.';
                  if (nameController.text.contains(RegExp(r'[0-9]'))) {
                    return 'Name contain numbers.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'Mobile Number',
                prefixIcon: Icons.phone_android_outlined,
                controller: phoneController,
                type: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) return 'Invalid Mobile Number.';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'Email address',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                type: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Invalid E-mail';
                  } else if (emailExist) {
                    return 'The account already exists for that email.';
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
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Invalid Password';
                  } else {
                    if (weakPassword) {
                      return 'The password provided is too weak.';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Text(
                'By signing up you agree with our Terms of use',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Already a member? ',
                      style: TextStyle(
                        color: Color(0xFFC1C0C0),
                        fontSize: 18,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
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
        if (!formKey.currentState!.validate()) print('fffffffffffffff');
        if (formKey.currentState!.validate()) {
          try {
            UserCredential credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
            await credential.user?.updateDisplayName(nameController.text);
            BlocProvider.of<AuthCubit>(context).user = credential;
            Navigator.pushNamed(context, SplashScreen.id);
            Timer(const Duration(seconds: 3), () {
              Navigator.popAndPushNamed(context, MenuScreen.id);
            });
          } on FirebaseException catch (e) {
            if (e.code == 'weak-password') {
              {
                weakPassword = true;
              }
            } else if (e.code == 'email-already-in-use') {
              emailExist = true;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                e.code,
                style: const TextStyle(fontSize: 16),
              )));
            }

            formKey.currentState!.validate();
            emailExist = false;
            weakPassword = false;
          }
        }
      }),
    );
  }
}
