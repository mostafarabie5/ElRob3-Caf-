import 'package:flutter/material.dart';
import 'package:magic_coffee/constants.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, this.field, this.prev});
  static String id = 'EditProfileScrren';
  final String? field;
  final String? prev;
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit ${field}',
          style: TextStyle(
            color: mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Edit your ${field}',
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 35),
          Text(
            'Current ${field} :   ${prev}',
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'New ${field}',
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(border: UnderlineInputBorder()),
                  onFieldSubmitted: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
