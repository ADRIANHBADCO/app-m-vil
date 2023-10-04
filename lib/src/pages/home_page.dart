import 'package:flutter/material.dart';
import '../widgets/Icon_container.dart';
import 'package:app_veterinaria/src/pages/Form_login_page.dart';
import 'package:app_veterinaria/src/pages/Form_register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/fondo.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        //backgroundColor: Colors.blueGrey[100],
        backgroundColor: Colors.transparent,
        body: ListView(
          //padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 100.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150.0,
                ),
                const Iconcontainer(
                  url: 'images/logocirculo.png',
                ),
                const Text(
                  'Cachorro PET',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '¡Genera tu cita ya!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 160.0,
                  height: 15.0,
                  child: Divider(color: Colors.white),
                ),
                const SizedBox(
                  height: 180.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormLoginPage(),
                    ));
                  },
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
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormRegisterPage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minimumSize: const Size(360, 55)),
                  child: const Text(
                    'Crear cuenta nueva',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 17.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
