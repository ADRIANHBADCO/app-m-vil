import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/button_elevated.dart';
import 'package:app_veterinaria/src/authenticated/home_signin.dart';
import 'package:app_veterinaria/src/unauthenticated/registrar_cuenta.dart';

class IniciarCuenta extends StatefulWidget {
  const IniciarCuenta({super.key});

  @override
  State<IniciarCuenta> createState() => _IniciarCuentaState();
}

class _IniciarCuentaState extends State<IniciarCuenta> {
  Future<void> _handleSubmit() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      final data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://proyectowebuni.com/api/loginusuario'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Inicio de sesión exitoso: ${responseData}');

        // Redirecciona al usuario a la página de inicio de sesión
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeSignin(),
        ));
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        print('Error en el servidor');
        // Muestra una notificación de error en el servidor
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error en el servidor'),
              content: Text('Inténtalo de nuevo más tarde.'),
              actions: [
                TextButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('Inicio de sesión fallido');
        // Muestra una notificación de error general
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Inicio de sesión fallido'),
              content: Text('Verifica tus credenciales.'),
              actions: [
                TextButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: <Widget>[
          Column(
            children: [
              const Text(
                'Ingresa tu e-mail y contraseña',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.blue,
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _passwordController,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              Buttonelevated(
                onPressed: _handleSubmit,
                text: 'Iniciar sesión',
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistrarCuenta(),
                  ));
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minimumSize: const Size(360, 55),
                ),
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
