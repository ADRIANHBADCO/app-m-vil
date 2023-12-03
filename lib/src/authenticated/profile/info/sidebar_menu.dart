import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/acerca_de.dart';
import 'package:app_veterinaria/src/authenticated/mi_cuenta.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/perfil_usuario_controller.dart';

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
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Mi cuenta'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MiCuenta(),
              ));
            },
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
