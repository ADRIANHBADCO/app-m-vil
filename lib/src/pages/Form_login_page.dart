import 'package:flutter/material.dart';

class FormLoginPage extends StatefulWidget {
  const FormLoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormLoginPageScreenState createState() => _FormLoginPageScreenState();
}

class _FormLoginPageScreenState extends State<FormLoginPage> {
  bool isLoading = true;

  // Simulamos una carga ficticia con un temporizador.
  void simulateLoading() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading =
            false; // Cambia isLoading a false para ocultar la pantalla de carga.
      });
    });
  }

  @override
  void initState() {
    super.initState();
    simulateLoading(); // Inicia la simulación de carga al iniciar la pantalla.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresa tu usuario y contraseña'),
      ),
      body: Stack(
        children: <Widget>[
          // Pantalla principal
          const Center(
            child: Text(
              'Contenido de login',
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          // Pantalla de carga desvanecida
          AnimatedOpacity(
            opacity: isLoading ? 1.0 : 0.0, // Controla la opacidad
            duration: const Duration(seconds: 1), // Duración de la animación
            child: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                  strokeWidth: 10,
                ), // Indicador de carga
              ),
            ),
          ),
        ],
      ),
    );
  }
}
