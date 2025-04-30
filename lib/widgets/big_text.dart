import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;

  final double size;
  final TextOverflow overflow;
BigText({
    super.key,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xff332d2b),
    required this.text,
    this.size=20
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: overflow,
        fontFamily: 'roboto',
        fontSize: size,
        color: color,
      ),
    );
  }
}
