import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_service.dart' as auth;
import '../data/database.dart';
import 'package:flutter/widgets.dart';
import '../widgets/filter_widget.dart' as fil;

class Garment {
  final int id;
  final ImageProvider<Object> image;

  Garment({required this.id, required this.image});
}

List<Garment> clothes = [];

Future<int?> obtenerIdUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('idUsuario');
}

List<ImageProvider<Object>> obtenerImageProviders(List<String> rutasImagenes) {
  List<ImageProvider<Object>> imageProviders = [];

  for (String rutaImagen in rutasImagenes) {
    ImageProvider<Object> imageProvider = FileImage(File(rutaImagen));
    imageProviders.add(imageProvider);
  }

  return imageProviders;
}

Future<List<Garment>> createGarmentsList() async {
  print("----------------------------");
  List<Garment> clothes = [];
  int? idUsuario = await obtenerIdUsuario();
  List<String> tokens = await auth.AuthService.findPrendasByUsuario();
  if (fil.FilterWidgetState.filter) {
    tokens = await auth.AuthService.filterPrendasByTipo(
        tokens, fil.FilterWidgetState.selectedTags);
  }
  List<ImageProvider<Object>> imagenes =
      await auth.AuthService.getImagesForPrendas(tokens);

//Aquí se lee cada una de las imagenes y se crean los objetos para para agregarlos a la lista de prendas
  for (int i = 1; i <= imagenes.length; i++) {
    print("----------------------------imagen #" + i.toString());

    clothes.add(
      Garment(
        id: i,
        image: imagenes[i - 1],
      ),
    );
  }

  return clothes;
}
