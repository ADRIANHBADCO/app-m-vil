import 'package:flutter/material.dart';
//import 'package:app_veterinaria/src/unauthenticated/login/iniciar_cuenta.dart';

class MiCuenta extends StatelessWidget {
  const MiCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi cuenta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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

  // Función para navegar a la pantalla "IniciarCuenta"
  void _navigateToIniciarCuenta(BuildContext context) {}

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
