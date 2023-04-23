import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('obtenerPrendasAleatorias', () {
    test('debería devolver una lista con tres prendas', () {
      final prendas = obtenerPrendasAleatorias();
      expect(prendas.length, 3);
    });

    test('debería devolver una prenda de tipo superior, una de tipo inferior y una de tipo calzado', () {
      final prendas = obtenerPrendasAleatorias();
      final tipos = prendas.map((prenda) => prenda['Tipo']).toList();
      expect(tipos.contains('camisa'), true);
      expect(tipos.contains('pantalón'), true);
      expect(tipos.contains('zapatos'), true);
    });

    test('debería devolver una sola prenda de tipo superior', () {
      final prendas = obtenerPrendasAleatorias();
      final superiores = prendas.where((prenda) => prenda['Tipo'] == 'camisa').toList();
      expect(superiores.length, 1);
    });

    test('debería devolver una sola prenda de tipo inferior', () {
      final prendas = obtenerPrendasAleatorias();
      final inferiores = prendas.where((prenda) => prenda['Tipo'] == 'pantalón').toList();
      expect(inferiores.length, 1);
    });

    test('debería devolver una sola prenda de tipo calzado', () {
      final prendas = obtenerPrendasAleatorias();
      final calzados = prendas.where((prenda) => prenda['Tipo'] == 'zapatos').toList();
      expect(calzados.length, 1);
    });
  });
}

List<Map<String, dynamic>> prendas = [
  {
    "Id": 1,
    "Idusuario": 1,
    "tokenImagen": "abc123",
    "Color": "azul",
    "Tipo": "camisa",
    "Formalidad": "informal",
  },
  {
    "Id": 2,
    "Idusuario": 1,
    "tokenImagen": "def456",
    "Color": "rojo",
    "Tipo": "pantalón",
    "Formalidad": "formal",
  },
  {
    "Id": 3,
    "Idusuario": 1,
    "tokenImagen": "ghi789",
    "Color": "verde",
    "Tipo": "zapatos",
    "Formalidad": "informal",
  },
  {
    "Id": 4,
    "Idusuario": 1,
    "tokenImagen": "jkl012",
    "Color": "negro",
    "Tipo": "chaqueta",
    "Formalidad": "formal",
  },
];

List<Map<String, dynamic>> obtenerPrendasAleatorias() {
  List<Map<String, dynamic>> prendasFiltradas = [];

  // Obtener aleatoriamente una prenda de tipo "superior"
  var prendasSuperiores =
      prendas.where((prenda) => prenda["Tipo"] == "camisa" || prenda["Tipo"] == "chaqueta").toList();
  var prendaSuperior = prendasSuperiores[Random().nextInt(prendasSuperiores.length)];
  prendasFiltradas.add(prendaSuperior);

  // Obtener aleatoriamente una prenda de tipo "inferior"
  var prendasInferiores = prendas.where((prenda) => prenda["Tipo"] == "pantalón").toList();
  var prendaInferior = prendasInferiores[Random().nextInt(prendasInferiores.length)];
  prendasFiltradas.add(prendaInferior);

  // Obtener aleatoriamente una prenda de tipo "calzado"
  var prendasCalzado = prendas.where((prenda) => prenda["Tipo"] == "zapatos").toList();
  var prendaCalzado = prendasCalzado[Random().nextInt(prendasCalzado.length)];
  prendasFiltradas.add(prendaCalzado);

  return prendasFiltradas;
}


