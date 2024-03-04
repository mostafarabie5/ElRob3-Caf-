import 'package:flutter/cupertino.dart';

class TextOption extends StatelessWidget {
  const TextOption(this.text, this.color, {super.key});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
