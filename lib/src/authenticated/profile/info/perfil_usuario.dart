import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/perfil_usuario_controller.dart';

class ProfilUsuario extends StatelessWidget {
  const ProfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFB0404),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserAvatar(),
            UserProfileInfo(),
            Divider(),
            UserActions(),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  PerfilUsuarioController controller = Get.put(PerfilUsuarioController());
  PerfilUsuarioController con = Get.find<PerfilUsuarioController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: con.user.imagen != null
            ? NetworkImage(con.user.imagen!)
            : AssetImage('images/user_profile.png') as ImageProvider,
      ),
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  PerfilUsuarioController con = Get.find<PerfilUsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${con.user.nombreUsuario ?? ''}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '${con.user.email ?? ''}',
        ),
        //Text('Ubicación: Ciudad, País'),
      ],
    );
  }
}

class UserActions extends StatelessWidget {
  PerfilUsuarioController con = Get.find<PerfilUsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
              '${con.user.nombre ?? ''} ${con.user.apaterno ?? ''} ${con.user.amaterno ?? ''}'),
          subtitle: Text('Nombre del usuario'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('${con.user.telefono ?? ''}'),
          subtitle: Text('Teléfono'),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('${con.user.email ?? ''}'),
          subtitle: Text('Email'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('${con.user.direccion ?? ''}'),
          subtitle: Text('Dirección'),
        ),
      ],
    );
  }
}
