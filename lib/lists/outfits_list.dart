import 'package:flutter/material.dart';
import 'clothes_list.dart';

class Outfit {
  final Garment top;
  final Garment bottom;
  final Garment shoes;

  Outfit({required this.top, required this.bottom, required this.shoes});
}

List<Outfit> outfits = createOutfitsList();

List<Outfit> createOutfitsList() {
  List<Outfit> outfits = [];

//Aquí se lee cada una de las imagenes y se crean los objetos para para agregarlos a la lista de prendas
  for (int i = 1; i <= 5; i++) {
    outfits.add(
      Outfit(
        top: clothes[3 * i - 3],
        bottom: clothes[3 * i - 2],
        shoes: clothes[3 * i - 1],
      ),
    );
  }
  for (int i = 1; i <= 5; i++) {
    outfits.add(
      Outfit(
        top: clothes[3 * i - 3],
        bottom: clothes[3 * i - 2],
        shoes: clothes[3 * i - 1],
      ),
    );
  }
  return outfits;
}
