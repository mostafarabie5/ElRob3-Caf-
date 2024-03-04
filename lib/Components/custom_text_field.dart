import 'package:flutter/material.dart';
import 'package:magic_coffee/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.type,
    this.validator,
    this.secure = false,
  });
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  TextInputType? type;
  bool secure;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: (type != null) ? type : null,
      obscureText: secure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFC1C0C0)),
        errorStyle: const TextStyle(fontSize: 17),
        prefixIcon: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(prefixIcon, color: mainColor),
              const SizedBox(width: 10),
              VerticalDivider(
                indent: 6,
                endIndent: 6,
                width: 0.8,
                thickness: 0.8,
                color: mainColor,
              )
            ],
          ),
        ),
      ),
      validator: validator,
    );
  }
}
