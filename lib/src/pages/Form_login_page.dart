import 'package:flutter/material.dart';

class FormLoginPage extends StatelessWidget {
  const FormLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresa tu usuario y contraseña'),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 90.0),
          children: const <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      hintText: 'User-name',
                      labelText: 'User name',
                      suffixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'User email',
                      suffixIcon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextField(
                  enableInteractiveSelection: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'User password',
                      suffixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                ),
                SizedBox(
                  height: 18.0,
                ),
              ],
            )
          ]),
    );
  }
}
