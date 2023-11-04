import 'package:flutter/material.dart';
import '../util/horizontal_lista.dart';
import 'package:app_veterinaria/src/util/carrusel_vt.dart';
import 'package:app_veterinaria/src/util/search_services.dart';
import 'package:app_veterinaria/src/util/productos_pages.dart';
import 'package:app_veterinaria/src/widgets/subtitulo_text.dart';
import 'package:app_veterinaria/src/util/horizontal_servicios.dart';
import 'package:app_veterinaria/src/unauthenticated/sidebar_menu.dart';
import 'package:app_veterinaria/src/unauthenticated/iniciar_cuenta.dart';

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
      drawer: const SidebarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchServices());
          },
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const IniciarCuenta(),
              ));
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          Column(
            children: [
              CarruselVt(),
              Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: SubtituloText(text: 'Categorias')
              ),
              HorizontalLista(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: SubtituloText(text: 'Servicios')
              ),
              HorizontalServicios(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: SubtituloText(text: 'Productos')
              ),
              ProductosPages(),
              SizedBox(height: 20.0)
            ],
          ),
        ],
      ),
    );
  }
}
