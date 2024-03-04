import 'package:flutter/material.dart';

class otpBox extends StatelessWidget {
  const otpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFC1C0C0),
      ),
      child: const TextField(
        style: TextStyle(fontSize: 36),
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
