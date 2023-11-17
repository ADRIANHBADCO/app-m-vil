import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/unauthenticated/home_signup.dart';
import 'package:app_veterinaria/src/authenticated/perfil_usuario.dart';

class MiCuenta extends StatelessWidget {
  const MiCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi cuenta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeSignup(),
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Salir'),
          ),
        ),
      ],
    );
  }
}
