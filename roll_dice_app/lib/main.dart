import 'package:flutter/material.dart';
import 'package:roll_dice_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer.purple(),
        // body: GradientContainer(
        //   Color.fromARGB(255, 141, 112, 192),
        //   Color.fromARGB(255, 116, 191, 221),
        // ),
      ),
    ),
  );
}


