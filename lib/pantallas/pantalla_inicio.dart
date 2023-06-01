import 'package:moreno/datos/data.dart';
import 'package:moreno/modelos/veterinaria.dart';
import 'package:moreno/pantallas/carrito.dart';
import 'package:moreno/pantallas/veterinaria_pantalla.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/orden_reciente.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({Key? key}) : super(key: key);

  @override
  State<PantallaInicio> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("La Huellita"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.account_circle, size: 30)),
        actions: [
          TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen())),
              child: Text(
                "Carrito (${currentUser.cart.length})",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(width: 0.8, color: Colors.black12)),
                  hintText: "Buscar productos o veterinarias",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear))),
            ),
          ),
          const OrdenReciente(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Veterinarias Cercas",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _construirVeterinarias()
            ],
          )
        ],
      ),
    );
  }

  _construirVeterinarias() {
    final List<Widget> veterinariaLista = [];
    restaurants.forEach((Veterinaria veterinaria) {
      veterinariaLista.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VeterinariaPantalla(restaurant: veterinaria),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1.0, color: Colors.grey.shade200)),
          child: Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: veterinaria.imagenUrl,
                    child: Image(
                      width: 150,
                      height: 150,
                      image: AssetImage(veterinaria.imagenUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          veterinaria.nombre,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingBar.builder(
                            initialRating: 5,
                            itemCount: veterinaria.puntuacion.toInt(),
                            allowHalfRating: true,
                            minRating: 1,
                            unratedColor: Colors.grey,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            itemBuilder: (context, _) =>
                                (const Icon(Icons.star, color: Colors.amber)),
                            onRatingUpdate: (rating) {
                              Text(veterinaria.puntuacion.toString());
                            }),
                        Text(
                          veterinaria.direccion,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
    return Column(
      children: veterinariaLista,
    );
  }
}
