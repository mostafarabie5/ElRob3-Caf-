import 'package:flutter/material.dart';

class OrderSpacer extends StatelessWidget {
  const OrderSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          height: 5,
          thickness: 2,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
