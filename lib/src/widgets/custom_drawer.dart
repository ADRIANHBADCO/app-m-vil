import 'package:flutter/material.dart';
//import 'package:app_veterinaria/src/unauthenticated/login/iniciar_cuenta.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFB0404),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFFB0404).withOpacity(
                      0.3), // Aquí ajusta el nivel de transparencia
                  child: ClipOval(
                    child: Image.asset(
                      'images/user.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0), // Ajusta la cantidad de espacio superior
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingresa a tu cuenta',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Podrás visualizar detalles\nde tu compra y personalizar\ntu experiencia',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0,
                16.0), // Ajusta la cantidad de espacio alrededor del botón
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minimumSize: const Size(300, 40)),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
