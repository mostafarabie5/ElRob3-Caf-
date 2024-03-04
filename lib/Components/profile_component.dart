import 'package:flutter/material.dart';
import 'package:magic_coffee/Screens/edit_profile.dart';
import '../constants.dart';

// ignore: must_be_immutable
class ProfileComponenet extends StatefulWidget {
  ProfileComponenet(
      {super.key,
      required this.field,
      required this.value,
      required this.icon});
  final String field;
  String value;
  final IconData icon;

  @override
  State<ProfileComponenet> createState() => _ProfileComponenetState();
}

class _ProfileComponenetState extends State<ProfileComponenet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(widget.icon),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.field,
                    style: TextStyle(color: Colors.grey.shade400)),
                Text(
                  widget.value,
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () async {
            widget.value = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditProfileScreen(field: widget.field, prev: widget.value),
              ),
            );
            setState(() {
              print(widget.value);
            });
          },
        )
      ],
    );
  }
}
