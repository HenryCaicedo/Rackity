import 'package:flutter/material.dart';
import 'dart:math';

class OutfitsTab extends StatelessWidget {
  const OutfitsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = 50.0;
    var x = 6.0;
    var y = -2.0;
    return Expanded(
      child: Material(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
            child: Stack(
              children: [
                //Debo redimensionar las imágenes de manera que todas queden del mismo ancho pero mantengan su aspect ratio
                Positioned(
                  top: 40 + y,
                  left: 24 + x,
                  child: Transform.rotate(
                    angle: 18 * pi / 180, // Convert 30 degrees to radians
                    child: Container(
                      width: size,
                      height: size,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  top: 75 + y,
                  left: 55 + x,
                  child: Transform.rotate(
                    angle: -10 * pi / 180, // Convert 30 degrees to radians
                    child: Container(
                      width: size,
                      height: size,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Positioned(
                  top: 33 + y,
                  left: 65 + x,
                  child: Transform.rotate(
                    angle: -15 * pi / 180, // Convert 30 degrees to radians
                    child: Container(
                      width: size,
                      height: size,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
