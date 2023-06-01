import 'package:moreno/modelos/producto.dart';

class Veterinaria {
  final String imagenUrl;
  final String nombre;
  final String direccion;
  final double puntuacion;
  final List<Food> menu;

  Veterinaria(
      {required this.imagenUrl,
      required this.nombre,
      required this.direccion,
      required this.puntuacion,
      required this.menu});
}
