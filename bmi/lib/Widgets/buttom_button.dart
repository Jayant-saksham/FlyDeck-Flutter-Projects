import 'package:bmi/constant/colors.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  const BottomButton({
    Key? key,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 50,
        color: bottomContainerColour,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
