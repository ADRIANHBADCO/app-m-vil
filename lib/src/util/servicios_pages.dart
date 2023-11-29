import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_veterinaria/src/util/citas/registrar_citas.dart';

class MyData {
  final String tipo;
  final String descripcion;
  final String imagen;
  MyData(this.tipo, this.descripcion, this.imagen);
}

class ServiciosPage extends StatefulWidget {
  const ServiciosPage({super.key});

  @override
  State<ServiciosPage> createState() => _ServiciosPageState();
}

class _ServiciosPageState extends State<ServiciosPage> {
  List<MyData> dataList = [];

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://proyectowebuni.com/api/servicios-all'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List) {
          dataList = data.map((item) {
            return MyData(item['tipo'], item['descripcion'], item['imagen']);
          }).toList();
        }
      }

      setState(() {});
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFFFB0404),
      ),
      backgroundColor: Colors.white,
      body: dataList.isEmpty
          ? const Center(
              child: SizedBox(
                width: 100, // Ajusta el ancho según tus necesidades
                height: 100, // Ajusta la altura según tus necesidades
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: dataList.map((data) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  shadowColor: Colors.grey,
                  elevation: 40,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        child: Image.network(data.imagen),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                data.tipo,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              subtitle: Text(
                                data.descripcion,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
