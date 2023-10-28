import 'package:flutter/material.dart';

class HorizontalLista extends StatelessWidget {
  const HorizontalLista({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category(name: 'Alimentos', imageUrl: 'images/alimento.jpg'),
          Category(name: 'Suplementos', imageUrl: 'images/suplemento.jpeg'),
          Category(name: 'Accesorios', imageUrl: 'images/accesorio.jpg'),
          Category(name: 'Vitaminas', imageUrl: 'images/vitaminas.jpg'),
          Category(name: 'Ropa', imageUrl: 'images/ropa.jpg'),
          Category(name: 'Higiene', imageUrl: 'images/higiene.jpg'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  final String imageUrl;

  const Category({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                imageUrl,
                width: 100,
                height: 80,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  name,
                  style:
                      const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ),
    );
  }
}
