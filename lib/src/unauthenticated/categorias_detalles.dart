import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/citas/registrar_citas.dart';
import 'package:app_veterinaria/src/util/horizontal_categorias.dart';

class CategoriasDetalles extends StatelessWidget {
  final Category category;

  const CategoriasDetalles({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.categoria,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFB0404),
      ),
      body: ListView(
        children: [
          Center(
            child: Image.network(
              category.imagencat,
              fit: BoxFit.cover,
              width: 400,
              height: 500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.categoria,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrarCitas(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          minimumSize: const Size(340, 55)),
                      child: const Text(
                        'Agendar cita',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
