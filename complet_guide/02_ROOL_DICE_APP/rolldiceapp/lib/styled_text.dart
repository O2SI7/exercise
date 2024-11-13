import 'package:flutter/material.dart';



class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 167, 9, 9),
        fontSize: 28,
      ),
    );
  }
}
