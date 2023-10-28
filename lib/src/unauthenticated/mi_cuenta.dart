import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/unauthenticated/iniciar_cuenta.dart';

class MiCuenta extends StatelessWidget {
  const MiCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi cuenta'),
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

  // Función para navegar a la pantalla "IniciarCuenta"
  void _navigateToIniciarCuenta(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const IniciarCuenta(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            _navigateToIniciarCuenta(context);
          },
          child: const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mi perfil'),
          ),
        ),
        InkWell(
          onTap: () {
            _navigateToIniciarCuenta(context);
          },
          child: const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Ingresar a cahorro PET'),
          ),
        ),
      ],
    );
  }
}
