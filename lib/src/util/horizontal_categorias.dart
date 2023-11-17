import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_veterinaria/src/util/categorias_detalles.dart';

class HorizontalCategorias extends StatefulWidget {
  const HorizontalCategorias({super.key});

  @override
  State<HorizontalCategorias> createState() => HorizontalCategoriasState();
}

class HorizontalCategoriasState extends State<HorizontalCategorias> {
  List<Category> categorys = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://proyectowebuni.com/api/categorias'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Category> loadedServices =
            data.map((serviceData) => Category.fromJson(serviceData)).toList();

        setState(() {
          categorys = loadedServices;
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categorys.map((category) {
          return ServiceWidget(category: category);
        }).toList(),
      ),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  final Category category;

  const ServiceWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoriasDetalles(category: category),
          ));
        },
        child: SizedBox(
          width: 100.0,
          child: ListTile(
            title: Image.network(
              category.imagencat,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                category.categoria,
                style:
                    const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  final String categoria;
  final String imagencat;

  Category({required this.categoria, required this.imagencat});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoria: json['categoria'],
      imagencat: json['imagencat'],
    );
  }
}
