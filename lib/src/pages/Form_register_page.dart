

import 'package:flutter/material.dart';

class FormRegisterPage extends StatefulWidget {
  const FormRegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormRegisterPageScreenState createState() => _FormRegisterPageScreenState();
}

class _FormRegisterPageScreenState extends State<FormRegisterPage> {
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
        title: const Text('Crear cuenta nueva'),
      ),
      body: Stack(
        children: <Widget>[
          // Pantalla principal
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Registro de usuarios',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 30.0),
              ),

              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey[600]),
              ),

              TextField(
                enableInteractiveSelection: false,
                // autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: 'Nombre de Usuario',
                    labelText: 'Nombre de Usuario',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {},
              ),

              Divider(
                height: 15.0,
              ),

              TextField(
                decoration: InputDecoration(
                    hintText: 'Correo',
                    labelText: 'Correo',
                    suffixIcon: Icon(Icons.alternate_email),
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
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
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
                    hintText: 'Confirmar Contraseña',
                    labelText: 'Confirmar Contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {},
              ),
              Divider(
                height: 15.0,
              ),

              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Registrar')
                  ),

                

                  Text(
                'Aviso de privacidad',
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
          )
        ],
      ),
    );
  }
}
