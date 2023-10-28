import '../util/acerca_de.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_veterinaria/src/util/search_services.dart';
import 'package:app_veterinaria/src/util/servicios_pages.dart';
import 'package:app_veterinaria/src/unauthenticated/mi_cuenta.dart';
import 'package:app_veterinaria/src/util/categorias_productos.dart';

class SidebarMenu extends StatelessWidget {
  _launchURL() async {
    const url =
        'https://proyectowebuni.com/archivos/Aviso%20de%20privacidad.pdf';
    await launch(url, forceSafariVC: false, forceWebView: false);
  }

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
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Buscar'),
            onTap: () {
              showSearch(context: context, delegate: SearchServices());
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Mi cuenta'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MiCuenta(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.date_range_outlined),
            title: const Text('Agendar cita'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ServiciosPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_list_bulleted_outlined),
            title: const Text('Categorias'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoriasProductos(),
              ));
            },
          ),
          const Divider(
            height: 20.0,
          ),
          //ListTile(
          //leading: const Icon(Icons.question_answer_outlined),
          //title: const Text('Preguntas frecuentes'),
          //onTap: () {},
          //),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Aviso de privacidad'),
            onTap: _launchURL,
          ),
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
        ],
      ),
    );
  }
}
