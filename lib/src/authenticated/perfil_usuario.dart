import 'package:flutter/material.dart';

class ProfilUsuario extends StatelessWidget {
  const ProfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.redAccent,
      ),
      body: const SingleChildScrollView(
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
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(
            'images/user.png'), // Reemplaza con la imagen de perfil real
      ),
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          'Adrian.com',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('btaadrian@gmail.com'),
        //Text('Ubicación: Ciudad, País'),
      ],
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
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mis datos'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Tarjetas'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Direcciones'),
          ),
        ),
      ],
    );
  }
}
