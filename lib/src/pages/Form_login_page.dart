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
        title: const Text('Usuario y Password'),
      ),
      body: Stack(
        children: <Widget>[
          // Pantalla principal
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Inicio de sesión',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 30.0),
              ),
              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey[600]),
              ),
              TextField(
                enableInteractiveSelection: false,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: 'Usuario',
                    labelText: 'Ingresa el nombre de usuario',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {},
              ),

              Divider(
                height: 15.0,
              ),

              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    labelText: 'Ingresa la contraseña',
                    suffixIcon: Icon(Icons.visibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {},
              ),
              Divider(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minimumSize: const Size(360, 55)),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontFamily: 'Ronoto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '¿Olvidaste la contraseña?',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 17.0),
              ),
              // Pantalla de carga desvanecida
              AnimatedOpacity(
                opacity: isLoading ? 1.0 : 0.0, // Controla la opacidad
                duration:
                    const Duration(seconds: 1), // Duración de la animación
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
        ],
      ),
    );
  }
}
