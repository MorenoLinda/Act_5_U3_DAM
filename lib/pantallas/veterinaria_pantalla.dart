import 'package:moreno/modelos/producto.dart';
import 'package:moreno/modelos/veterinaria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VeterinariaPantalla extends StatefulWidget {
  final Veterinaria restaurant;

  VeterinariaPantalla({required this.restaurant});

  @override
  State<VeterinariaPantalla> createState() => _VeterinariaPantallaState();
}

class _VeterinariaPantallaState extends State<VeterinariaPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: widget.restaurant.imagenUrl,
              child: Image(
                height: 220,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(widget.restaurant.imagenUrl),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    iconSize: 35,
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.restaurant.nombre,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "A unos 1.2 km de ti",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 10),
              RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  allowHalfRating: true,
                  unratedColor: Colors.grey,
                  itemSize: 20,
                  itemBuilder: (context, _) => (Icon(
                        Icons.star,
                        color: Colors.amber,
                      )),
                  onRatingUpdate: (rating) {
                    Text(rating.toString());
                  }),
              SizedBox(height: 10),
              Text(
                widget.restaurant.direccion,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  splashColor: Colors.grey,
                  elevation: 4,
                  hoverElevation: 10,
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {},
                  child: Text(
                    "Reviews",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              MaterialButton(
                  splashColor: Colors.grey,
                  elevation: 4,
                  hoverElevation: 10,
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {},
                  child: Text(
                    "Contact",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Menu",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2),
        ),
        SizedBox(height: 10),
        Expanded(
            child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          children: List.generate(widget.restaurant.menu.length, (index) {
            Food food = widget.restaurant.menu[index];
            return _buildMenuItems(food);
          }),
        ))
      ],
    ));
  }

  Widget _buildMenuItems(Food menuItems) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175,
            width: 175,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(menuItems.imagen), fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: 175,
            height: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black45.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                menuItems.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$${menuItems.precio}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Positioned(
              bottom: 15,
              right: 10,
              child: Container(
                // width: 48,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )),
              ))
        ],
      ),
    );
  }
}
