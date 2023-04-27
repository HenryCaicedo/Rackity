import 'package:flutter/material.dart';

class RackityCardWidget extends StatelessWidget {
  final Widget child;

  RackityCardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color.fromRGBO(39, 88, 76, 0.85), width: 2),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(39, 88, 76, 0.85).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white, // add this line to set the background color
      ),
      child: child,
    );
  }
}
