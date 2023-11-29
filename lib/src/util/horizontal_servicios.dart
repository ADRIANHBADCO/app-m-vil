import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_veterinaria/src/unauthenticated/servicios_detalles.dart';

class HorizontalServicios extends StatefulWidget {
  const HorizontalServicios({super.key});

  @override
  State<HorizontalServicios> createState() => HorizontalServiciosState();
}

class HorizontalServiciosState extends State<HorizontalServicios> {
  List<Service> servicies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://proyectowebuni.com/api/servicios-all'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Service> loadedServices =
            data.map((serviceData) => Service.fromJson(serviceData)).toList();

        setState(() {
          servicies = loadedServices;
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
        children: servicies.map((service) {
          return ServiceWidget(service: service);
        }).toList(),
      ),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  final Service service;

  const ServiceWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServiciosDetalles(service: service),
          ));
        },
        child: SizedBox(
          width: 100.0,
          child: ListTile(
            title: SizedBox(
              height: 80.0,
              width: 80.0,
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(service.imagen),
              ),
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                service.tipo,
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

class Service {
  final String tipo;
  final String imagen;
  final String descripcion;

  Service(
      {required this.tipo, required this.descripcion, required this.imagen});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      tipo: json['tipo'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
    );
  }
}
