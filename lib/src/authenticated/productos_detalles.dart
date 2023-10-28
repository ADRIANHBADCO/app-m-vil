import 'package:flutter/material.dart';

class Product {
  String nombre;
  String imagen;
  String descripcion;
  int precio;
  int categoria;
  int marca;
  int cantidad;

  Product({
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    required this.marca,
    required this.cantidad,
  });
}

class ProductosDetalles extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductosDetalles({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductosDetalles> createState() => _ProductosDetallesState();
}

class _ProductosDetallesState extends State<ProductosDetalles> {
  List<Product> cart = [];

  void addToCart() {
    setState(() {
      cart.add(Product(
        nombre: widget.product['nombre'],
        imagen: widget.product['imagen'],
        descripcion: widget.product['descripcion'],
        precio: widget.product['precio'],
        categoria: widget.product['categoria'],
        marca: widget.product['marca'],
        cantidad: widget.product['cantidad'],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product['nombre'],
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          Center(
            child: Image.network(
              widget.product['imagen'],
              fit: BoxFit.cover,
              width: 350,
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.product['nombre'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.product['descripcion'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Precio: \$${widget.product['precio']}',
                    style: const TextStyle(
                      fontSize: 23,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Categoria: ${widget.product['categoria']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Marca: ${widget.product['marca']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${widget.product['cantidad']} productos en existencia',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  const Row(
                    children: <Widget>[],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addToCart();
                    },
                    child: const Text('Agregar al carrito'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
