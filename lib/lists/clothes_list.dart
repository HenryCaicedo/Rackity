import 'package:flutter/material.dart';

class Garment {
  final int id;
  final ImageProvider<Object> image;

  Garment({required this.id, required this.image});
}

List<Garment> clothes = createGarmentsList();

List<Garment> createGarmentsList() {
  List<Garment> clothes = [];

//Aquí se lee cada una de las imagenes y se crean los objetos para para agregarlos a la lista de prendas
  for (int i = 1; i <= 16; i++) {
    clothes.add(
      Garment(
        id: i,
        image: AssetImage('assets/clothes/garment$i.png'),
      ),
    );
  }

  return clothes;
}
