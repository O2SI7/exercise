import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DicceRollerState();
  }
}

class _DicceRollerState extends State<DiceRoller> {
  //var activeDiceImage = 'assets/images/dice-2.png';
  var currenDiceRoll = 2;

  void rollDice() {
    setState(() {
      currenDiceRoll = randomizer.nextInt(6) + 1; // 0 < > 6
    });
    print('Changing image');
    print('현재 $currenDiceRoll 값입니다.');
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currenDiceRoll.png',
          width: 500,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // sizebox의 고정값에서 추가적으로 늘릴때 쓰는 방법),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Touch'),
        )
      ],
    );
  }
}
