import 'package:flutter/material.dart';
import '../widgets/button_elevated.dart';
import 'package:app_veterinaria/src/authenticated/home_signin.dart';
import 'package:app_veterinaria/src/unauthenticated/registrar_cuenta.dart';

class IniciarCuenta extends StatefulWidget {
  const IniciarCuenta({super.key});

  @override
  State<IniciarCuenta> createState() => _IniciarCuentaState();
}

class _IniciarCuentaState extends State<IniciarCuenta> {
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
              TextField(
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
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
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
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              Buttonelevated(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeSignin(),
                  ));
                },
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
