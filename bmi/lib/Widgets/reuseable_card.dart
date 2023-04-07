import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Widget cardChild;
  final Color color;
  final Function onPress;
  const ReuseableCard({
    Key? key,
    required this.cardChild,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
