import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({
    super.key,
    required this.icon,
     this.backgroundColor=const Color(0xfffcf4e4),
     this.iconColor=const Color(0xff756d54),
     this.size=50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle
        ,color: backgroundColor
      
      ),
      child: Center(child: Icon(icon,color: iconColor,)),
    );
  }
}
