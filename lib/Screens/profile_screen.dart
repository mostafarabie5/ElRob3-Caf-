import 'package:flutter/material.dart';
import 'package:magic_coffee/Components/profile_component.dart';
import 'package:magic_coffee/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static String id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: mainColor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 15,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView(
            children: [
              ProfileComponenet(
                field: 'Name',
                value: 'Alex',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 30),
              ProfileComponenet(
                field: 'Phone Number',
                value: '+201112605450',
                icon: Icons.phone,
              ),
              const SizedBox(height: 30),
              ProfileComponenet(
                field: 'Email',
                value: '.mm@gmail.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 50,
              ),
              QrImageView(
                  data: 'https://www.linkedin.com/in/mostafa-rabie-90458a209/'),
            ],
          ),
        ),
      ),
    );
  }
}
