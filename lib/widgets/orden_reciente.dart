import 'package:moreno/datos/data.dart';
import 'package:moreno/modelos/orden.dart';
import 'package:flutter/material.dart';

class OrdenReciente extends StatelessWidget {
  const OrdenReciente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Producto Reciente",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          // color: Colors.blue,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              }),
        )
      ],
    );
  }

  Widget _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      width: 320,
      height: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.0, color: Colors.grey.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(order.food.imagen),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        /*const SizedBox(
                          height: 4,
                        ),*/
                        Text(
                          order.restaurant.nombre,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(order.date,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: 48,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(30)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
