import 'package:flutter/material.dart';
import '../widgets/Icon_container.dart';
import '../widgets/button_elevated.dart';
import '../widgets/button_dropdown.dart';

class FormCitasTwo extends StatefulWidget {
  const FormCitasTwo({super.key});

  @override
  State<FormCitasTwo> createState() => _FormCitasTwoState();
}

class _FormCitasTwoState extends State<FormCitasTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: <Widget>[
          Column(
            children: [
              const Iconcontainer(
                url: 'images/logocirculo.png',
              ),
              const Text(
                'Agendar cita',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 170.0,
                height: 2.0,
                child: Divider(color: Colors.black),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Buttondropdown(
                items: const [
                  DropdownMenuItem(
                    value: 'Macho',
                    child: Text('Macho'),
                  ),
                  DropdownMenuItem(
                    value: 'Hembra',
                    child: Text('Hembra'),
                  ),
                ],
                onChanged: (value) {},
                labelText: 'Sexo de la mascota',
              ),
              const SizedBox(
                height: 15.0,
              ),
              Buttondropdown(
                items: const [
                  DropdownMenuItem(
                    value: '08:00:00',
                    child: Text('08:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '09:00:00',
                    child: Text('09:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '10:00:00',
                    child: Text('10:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '11:00:00',
                    child: Text('11:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '12:00:00',
                    child: Text('12:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '13:00:00',
                    child: Text('13:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '14:00:00',
                    child: Text('14:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '15:00:00',
                    child: Text('15:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '16:00:00',
                    child: Text('16:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '17:00:00',
                    child: Text('17:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '18:00:00',
                    child: Text('18:00:00'),
                  ),
                  DropdownMenuItem(
                    value: '19:00:00',
                    child: Text('19:00:00'),
                  ),
                ],
                onChanged: (value) {},
                labelText: 'Hora de la cita',
              ),
              const SizedBox(
                height: 15.0,
              ),
              Buttondropdown(
                items: const [
                  DropdownMenuItem(
                    value: 'Estética canina',
                    child: Text('Estética canina'),
                  ),
                  DropdownMenuItem(
                    value: 'Ultrasonido',
                    child: Text('Ultrasonido'),
                  ),
                  DropdownMenuItem(
                    value: 'Cirugia',
                    child: Text('Cirugia'),
                  ),
                  DropdownMenuItem(
                    value: 'Consulta general',
                    child: Text('Consulta general'),
                  ),
                  DropdownMenuItem(
                    value: 'Análisis clínicos',
                    child: Text('Análisis clínicos'),
                  ),
                  DropdownMenuItem(
                    value: 'Radiografía',
                    child: Text('Radiografía'),
                  ),
                  DropdownMenuItem(
                    value: 'Cremación',
                    child: Text('Cremación'),
                  ),
                  DropdownMenuItem(
                    value: 'Otro',
                    child: Text('Otro'),
                  ),
                ],
                onChanged: (value) {},
                labelText: 'Tipo de servicio',
              ),
              const SizedBox(
                height: 15.0,
              ),
              Buttonelevated(
                onPressed: () {},
                text: 'Registrar',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
