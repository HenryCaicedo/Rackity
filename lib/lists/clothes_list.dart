import 'package:flutter/material.dart';

class Garment {
  final int id;
  final ImageProvider<Object> image;

  Garment({required this.id, required this.image});
}

List<Garment> clothes = [
  Garment(
    id: 1,
    image: AssetImage('assets/clothes/garment1.png'),
  ),
  Garment(
    id: 2,
    image: AssetImage('assets/clothes/garment2.png'),
  ),
  Garment(
    id: 3,
    image: AssetImage('assets/clothes/garment3.png'),
  ),
  Garment(
    id: 4,
    image: AssetImage('assets/clothes/garment4.png'),
  ),
  Garment(
    id: 5,
    image: AssetImage('assets/clothes/garment5.png'),
  ),
  Garment(
    id: 6,
    image: AssetImage('assets/clothes/garment6.png'),
  ),
];
