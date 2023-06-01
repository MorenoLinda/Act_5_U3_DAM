import 'package:moreno/modelos/producto.dart';
import 'package:moreno/modelos/veterinaria.dart';

class Order {
  final Veterinaria restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order(
      {required this.restaurant,
      required this.food,
      required this.date,
      required this.quantity});
}
