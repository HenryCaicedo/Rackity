import 'package:flutter/material.dart';
import '../lists/clothes_list.dart';

class GarmentScreen extends StatelessWidget {
  final Garment garment;

  GarmentScreen({required this.garment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garment Screen'),
      ),
      body: Center(
        child: Image(
          image: garment.image,
        ),
      ),
    );
  }
}
