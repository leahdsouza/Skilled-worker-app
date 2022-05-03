import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.icon,  required this.size, required this.color, required this.elevation, });
  final IconData icon;
  
  final double size;
  final Color color;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: elevation ?? 0,
      constraints: BoxConstraints.tightFor(
        width: size.toDouble(),
        height: size.toDouble(),
      ),
      shape: CircleBorder(),
      fillColor: color ?? Colors.transparent,
      splashColor: Colors.white,
      onPressed: () {
        
      },
    );
  }
}