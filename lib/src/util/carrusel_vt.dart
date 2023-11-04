import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarruselVt extends StatefulWidget {
  const CarruselVt({super.key});

  @override
  State<CarruselVt> createState() => CarruselVtState();
}

class CarruselVtState extends State<CarruselVt> {
  List<String> imageUrls = [];

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

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
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
    return Column(
        children: <Widget>[ 
        CarouselSlider(
        carouselController: buttonCarouselController,
        options: CarouselOptions(
            autoPlay: true,
            height: 200,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(microseconds: 800),
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
      ],
    );
  }
}
