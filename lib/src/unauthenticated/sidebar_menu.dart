import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'package:app_veterinaria/src/util/acerca_de.dart';
import 'package:app_veterinaria/src/unauthenticated/mi_cuenta.dart';
import 'package:app_veterinaria/src/unauthenticated/registro/registrar_cuenta.dart';
//import 'package:app_veterinaria/src/unauthenticated/product/lista/products_list.dart';
//import 'package:app_veterinaria/src/util/search_services.dart';
//import 'package:app_veterinaria/src/util/servicios_pages.dart';
//import 'package:app_veterinaria/src/util/citas/registrar_citas.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const CustomDrawer(),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.blue,
            ),
            title: const Text(
              'Inicio',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          /*ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Buscar'),
            onTap: () {
              showSearch(context: context, delegate: SearchServices());
            },
          ),*/
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Mi cuenta'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MiCuenta(),
              ));
            },
          ),
          /*ListTile(
            leading: const Icon(Icons.date_range_outlined),
            title: const Text('Agendar cita'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegistrarCitas(),
              ));
            },
          ),*/
          /*ListTile(
            leading: const Icon(Icons.health_and_safety_outlined),
            title: const Text('Servicios'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ServiciosPage(),
              ));
            },
          ),*/
          const Divider(
            height: 20.0,
          ),
          ListTile(
            title: const Text('Acerca de cachorro PET'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AcercaDe(),
              ));
            },
          ),
          //ListTile(
          //leading: const Icon(Icons.question_answer_outlined),
          //title: const Text('Preguntas frecuentes'),
          //onTap: () {},
          //),
        ],
      ),
    );
  }
}
