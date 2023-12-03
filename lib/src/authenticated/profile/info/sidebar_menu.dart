import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/acerca_de.dart';
import 'package:app_veterinaria/src/authenticated/mi_cuenta.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/perfil_usuario_controller.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/products/create/pet_products.dart';
//import 'package:app_veterinaria/src/util/search_services.dart';
//import 'package:app_veterinaria/src/authenticated/profile/info/categories/create/pet_categories.dart';
//import 'package:app_veterinaria/src/util/servicios_pages.dart';
//import 'package:app_veterinaria/src/util/citas/registrar_citas.dart';
//import 'package:app_veterinaria/src/util/categorias_productos.dart';

class SidebarMenu extends StatelessWidget {
  PerfilUsuarioController controller = Get.put(PerfilUsuarioController());
  PerfilUsuarioController con = Get.find<PerfilUsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '${con.user.nombreUsuario ?? ''}',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              '${con.user.email ?? ''}',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              backgroundImage: con.user.imagen != null
                  ? NetworkImage(con.user.imagen!)
                  : AssetImage('images/user_profile.png') as ImageProvider,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFB0404),
            ),
          ),
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
                builder: (context) => MiCuenta(),
              ));
            },
          ),
          /*ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Register categoria'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PetCategories(),
              ));
            },
          ),*/
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Register producto'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PetProducts(),
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
          //ListTile(
          //leading: const Icon(Icons.//question_answer_outlined),
          //title: const Text('Preguntas frecuentes'),
          //onTap: () {},
          //),
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
