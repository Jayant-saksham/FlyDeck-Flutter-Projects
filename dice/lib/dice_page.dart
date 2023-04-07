import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int selectedNumberRight = Random().nextInt(6) + 1;
  int selectedNumberLeft = Random().nextInt(6) + 1;
  void generateNumberRight() {
    setState(() {
      selectedNumberRight = Random().nextInt(6) + 1;
    });
  }

  void generateNumberLeft() {
    setState(() {
      selectedNumberLeft = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
          elevation: 0.0,
          title: Text("The Dice"),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: generateNumberLeft,
                    child: Image.asset(
                        "assets/images/dice${selectedNumberLeft}.png"),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: InkWell(
                    onTap: generateNumberRight,
                    child: Image.asset(
                        "assets/images/dice${selectedNumberRight}.png"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
