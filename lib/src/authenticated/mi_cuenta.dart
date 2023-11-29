import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/unauthenticated/home_signup.dart';
import 'package:app_veterinaria/src/authenticated/home/home_controller.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/perfil_usuario.dart';

class MiCuenta extends StatelessWidget {
  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi cuenta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFB0404),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserActions(),
          ],
        ),
      ),
    );
  }
}

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilUsuario(),
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mi perfil'),
          ),
        ),
        InkWell(
          onTap: () {
            HomeController con = Get.find<HomeController>();
            con.signOut();
          },
          child: const ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Salir'),
          ),
        ),
      ],
    );
  }
}
