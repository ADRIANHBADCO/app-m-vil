import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../util/horizontal_lista.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_veterinaria/src/util/search_services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:app_veterinaria/src/util/horizontal_servicios.dart';
import 'package:app_veterinaria/src/authenticated/sidebar_menu.dart';
import 'package:app_veterinaria/src/authenticated/carrito_compras.dart';
import 'package:app_veterinaria/src/authenticated/productos_detalles.dart';
//import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeSignin extends StatefulWidget {
  const HomeSignin({super.key});

  @override
  State<HomeSignin> createState() => _HomeSigninState();
}

class _HomeSigninState extends State<HomeSignin> {
  List<String> imageUrls = [];
  List<Map<String, dynamic>> products = [];

  Future<void> fetchImageUrls() async {
    try {
      final response =
          await http.get(Uri.parse('https://proyectowebuni.com/api/carrusel'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<String> urls =
            data.map((item) => item['imagen']).cast<String>().toList();
        setState(() {
          imageUrls = urls;
        });
      } else {
        throw Exception('Error al obtener las imágenes desde el servicio web');
      }
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  int myCurrentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  Timer? timer;

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://proyectowebuni.com/api/productos-all'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          products = data.cast<Map<String, dynamic>>();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
    fetchData();
    // Inicia un temporizador para cambiar automáticamente las imágenes cada 3 segundos.
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (myCurrentIndex < imageUrls.length - 1) {
        myCurrentIndex++;
      } else {
        myCurrentIndex = 0;
      }
      buttonCarouselController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void dispose() {
    // Asegúrate de cancelar el temporizador cuando el widget se desmonta para evitar pérdidas de memoria.
    timer?.cancel();
    super.dispose();
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
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined,
                    color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CarritoCompras(),
                  ));
                },
              ),
              Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    constraints:
                        const BoxConstraints(minWidth: 14, maxHeight: 18),
                    child: const Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(microseconds: 800),
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        myCurrentIndex = index;
                      });
                    }),
                items: imageUrls.map((url) {
                  return Image.network(url);
                }).toList(),
              ),
              AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: imageUrls.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 10,
                  dotColor: Colors.red,
                  activeDotColor: Colors.black,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const HorizontalLista(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: Text(
                  'Servicios',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const HorizontalServicios(),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: Text(
                  'Productos',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _builListItem(context, index);
                  },
                ),
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ],
      ),
    );
  }

  Widget _builListItem(BuildContext context, int index) {
    final product = products[index];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          _showProductDetail(context, product);
        },
        child: SizedBox(
          width: 150,
          height: 300,
          child: Card(
            elevation: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Image.network(
                    product['imagen'],
                    fit: BoxFit.cover,
                    width: 150,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product['nombre'],
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    '\$${product['precio']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProductDetail(BuildContext context, Map<String, dynamic> product) {
    // Aquí puedes mostrar los detalles del producto. Puedes navegar a una nueva pantalla
    // o mostrar un diálogo, dependiendo de tus preferencias de diseño.
    // Por ejemplo, puedes usar Navigator para navegar a una nueva pantalla de detalle.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductosDetalles(product: product),
      ),
    );
  }
}
