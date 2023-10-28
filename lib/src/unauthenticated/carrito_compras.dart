import 'package:flutter/material.dart';

class CarritoCompras extends StatefulWidget {
  const CarritoCompras({super.key});

  @override
  State<CarritoCompras> createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  final List<String> compras = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Verifica si la lista de compras está vacía
            compras.isEmpty
                ? Text('No hay ninguna compra.')
                : Expanded(
                    // Muestra los productos si la lista no está vacía
                    child: ListView.builder(
                      itemCount: compras.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(compras[index]),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar un producto a la lista de compras
          setState(() {
            compras.add('Nuevo Producto');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
