import 'package:flutter/material.dart';
//import 'package:app_veterinaria/src/pages/Form_register_page.dart';
//import 'package:app_veterinaria/src/pages/Form_login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/fondo.png'), fit: BoxFit.cover),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/logocirculo.png'),
                ),
                Text(
                  'Cachorro PET',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '¡Genera tu cita ya!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 15.0,
                  child: Divider(color: Colors.white),
                ),
                SizedBox(
                  height: 280.0,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
