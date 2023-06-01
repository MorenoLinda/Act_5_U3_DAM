// Food

import 'package:moreno/modelos/producto.dart';
import 'package:moreno/modelos/orden.dart';
import 'package:moreno/modelos/veterinaria.dart';
import 'package:moreno/modelos/user.dart';

final _cepillo =
    Food(imagen: "assets/images/cepillo.jpg", name: "Cepillo", precio: 51.99);

final _pelotas =
    Food(imagen: "assets/images/pelotas.jpg", name: "Pelotas", precio: 134.10);

final _jaulaP = Food(
    imagen: "assets/images/jaulaPerros.jpg",
    name: "Jaula para perros",
    precio: 1899);

final _limpiador = Food(
    imagen: "assets/images/limpiador.jpg", name: "Limpiador", precio: 65.46);

final _bozalP = Food(
    imagen: "assets/images/bozal.jpg",
    name: "Bozal para Perro",
    precio: 180.50);

final _despa = Food(
    imagen: "assets/images/desparasitante.jpg",
    name: "Desparasitante",
    precio: 69.99);

final _arnesP = Food(
    imagen: "assets/images/arnes.jpg",
    name: "Arnes para perro",
    precio: 239.00);

final _termometro = Food(
    imagen: "assets/images/termometro.jpg", name: "Termometro", precio: 164.99);

// Restaurants

final _veterinaria0 = Veterinaria(
    imagenUrl: "assets/images/veterinaria0.jpg",
    nombre: "La Huellita",
    direccion: "Nogal 306, Insurgentes, 32150",
    puntuacion: 5,
    menu: [
      _cepillo,
      _pelotas,
      _jaulaP,
      _limpiador,
      _bozalP,
      _despa,
      _arnesP,
      _termometro
    ]);

final __veterinaria1 = Veterinaria(
    imagenUrl: "assets/images/veterinaria1.jpg",
    nombre: "Cuatro Patas",
    direccion: "Valle del Sol-4 1151 Salvacar,",
    puntuacion: 4.1,
    menu: [_pelotas, _jaulaP, _limpiador, _bozalP, _despa, _arnesP]);

final _veterinaria2 = Veterinaria(
    imagenUrl: "assets/images/veterinaria2.jpg",
    nombre: "El chucho feliz",
    direccion: "Henequen 381",
    puntuacion: 5,
    menu: [_pelotas, _jaulaP, _bozalP, _despa, _arnesP, _termometro]);

final _veterinaria3 = Veterinaria(
    imagenUrl: "assets/images/veterinaria3.jpg",
    nombre: "Little pets",
    direccion: "Boulevard Municipio Libre 1638 Melchor Ocampo",
    puntuacion: 4.3,
    menu: [_despa, _pelotas, _despa, _arnesP, _termometro]);

final _veterinaria4 = Veterinaria(
    imagenUrl: "assets/images/veterinaria4.jpg",
    nombre: "Pet Zone",
    direccion: "Belisario Dominguez 1679 Colonia Chaveña",
    puntuacion: 4.0,
    menu: [_despa, _limpiador, _bozalP, _termometro]);

// Restaurants List

final List<Veterinaria> restaurants = [
  _veterinaria0,
  __veterinaria1,
  _veterinaria2,
  _veterinaria3,
  _veterinaria4
];

// User

final currentUser = User(name: "Zeeshan Ahmed", orders: [
  Order(
      restaurant: _veterinaria2,
      food: _pelotas,
      date: "Apr 30, 2022",
      quantity: 1),
  Order(
      restaurant: _veterinaria0,
      food: _limpiador,
      date: "Apr 28, 2022",
      quantity: 3),
  Order(
      restaurant: __veterinaria1,
      food: _cepillo,
      date: "Apr 30, 2022",
      quantity: 2),
  Order(
      restaurant: _veterinaria3,
      food: _termometro,
      date: "Apr 30, 2022",
      quantity: 1),
  Order(
      restaurant: _veterinaria4,
      food: _bozalP,
      date: "Apr 30, 2022",
      quantity: 1)
], cart: [
  Order(
      restaurant: _veterinaria2,
      food: _despa,
      date: "Apr 29, 2022",
      quantity: 2),
  Order(
      restaurant: _veterinaria2,
      food: _jaulaP,
      date: "Apr 30, 2022",
      quantity: 1),
  Order(
      restaurant: _veterinaria3,
      food: _termometro,
      date: "Apr 30, 2022",
      quantity: 1),
  Order(
      restaurant: _veterinaria4,
      food: _bozalP,
      date: "Apr 29, 2022",
      quantity: 3),
  Order(
      restaurant: __veterinaria1,
      food: _cepillo,
      date: "Apr 30, 2022",
      quantity: 2)
]);
