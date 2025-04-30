import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;

  final double size;
  double high;

  SmallText({
    super.key,
    this.high = 1.2,

    this.color = const  Color(0xffccc7c5),
    required this.text,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: high,

        fontFamily: 'roboto',
        fontSize: size,
        color: color,
      ),
    );
  }
}
