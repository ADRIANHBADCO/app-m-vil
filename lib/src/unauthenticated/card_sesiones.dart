import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/unauthenticated/login/iniciar_cuenta.dart';
import 'package:app_veterinaria/src/unauthenticated/registro/registrar_cuenta.dart';

class CardSesiones extends StatelessWidget {
  const CardSesiones({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¡Crea una cuenta para mejorar tu experiencia!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrarCuenta(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minimumSize: const Size(360, 40)),
                  child: const Text(
                    'Crear cuenta',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IniciarCuenta(),
                    ));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minimumSize: const Size(360, 55),
                  ),
                  child: const Text(
                    'Ingresar a mi cuenta',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
