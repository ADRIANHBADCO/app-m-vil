import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/carrusel_vt.dart';
import 'package:app_veterinaria/src/unauthenticated/card_sesiones.dart';
//import 'package:app_veterinaria/src/unauthenticated/login/iniciar_cuenta.dart';

class HomeSignup extends StatefulWidget {
  const HomeSignup({super.key});

  @override
  State<HomeSignup> createState() => _HomeSignupState();
}

class _HomeSignupState extends State<HomeSignup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFFFB0404),
        elevation: 0,
        title: InkWell(
          onTap: () {},
          child: Center(
            child: Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Text('Buscar en cachorro PET',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto',
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: const [
          Column(
            children: [
              CarruselVt(),
              CardSesiones(),
            ],
          ),
        ],
      ),
    );
  }
}
