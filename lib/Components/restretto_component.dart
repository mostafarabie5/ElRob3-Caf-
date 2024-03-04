import 'package:flutter/material.dart';
import 'package:magic_coffee/constants.dart';

class RestrettoComponenet extends StatelessWidget {
  const RestrettoComponenet({
    super.key,
    required this.quantity,
    required this.size,
  });
  final String quantity;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: (quantity == size)
              ? Border.all(color: mainColor, width: 1.5)
              : Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child:
          Text(quantity, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
