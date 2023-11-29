import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFFFB0404),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Clinica cachorro PET',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 16.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 290.0),
                  child: Text(
                    'MISION',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Buscar la excelencia en la prevención, detección y curación de enfermedades en animales de compañía, aumentando el nivel de seguridad sanitaria en quienes conviven con ellos y hacerlo de forma sostenible, rentable, profesional y ética; así como mejorar la relación afectiva entre las mascotas y sus propietarios, generando un mayor equilibrio sanitario y emocional en ambos.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 14.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 290.0),
                  child: Text(
                    'VISION',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Ofrecer bienestar tanto animal, como a las familias de nuestros pacientes a través de la prestación de servicios médicos veterinarios y complementarios, entregando calidad y satisfacción, superando las expectativas de nuestros clientes, contribuyendo a la innovación y desarrollo profesional del sector Médico Veterinario de la Región.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 14.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 275.0),
                  child: Text(
                    'VALORES',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Integridad\nÉtica Profesional\nRespeto.\nPaciencia\nCompromiso.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
