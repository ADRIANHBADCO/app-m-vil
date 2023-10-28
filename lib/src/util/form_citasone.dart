import '../widgets/Input_field.dart';
import 'package:flutter/material.dart';
import '../widgets/Icon_container.dart';
import '../widgets/button_elevated.dart';
import 'package:app_veterinaria/src/util/form_citastwo.dart';

class FormCitasOne extends StatefulWidget {
  const FormCitasOne({super.key});

  @override
  State<FormCitasOne> createState() => _FormCitasOneState();
}

class _FormCitasOneState extends State<FormCitasOne> {
  String _nombre = 'Juan';

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
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Nombre de la mascota',
                  labelText: 'Nombre mascota',
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                ),
                onSubmitted: (valor) {
                  _nombre = valor;
                  print('El nombre es $_nombre');
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Inputfield(
                hintText: 'Raza de la mascota',
                labelText: 'Raza mascota',
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              Inputfield(
                hintText: 'Nombre del propietario',
                labelText: 'Nombre propietario',
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Teléfono del propietario',
                  labelText: 'Teléfono propietario',
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Edad de la mascota',
                  labelText: 'Edad mascota',
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              Buttonelevated(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FormCitasTwo(),
                  ));
                },
                text: 'Siguiente',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
