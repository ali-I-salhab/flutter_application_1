import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';

class TextAndIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;
  const TextAndIconWidget({super.key, required this.iconData, required this.color,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(iconData,color: color,),
      SizedBox(width: 5,),
      SmallText(text: text)
    ],);
  }
}