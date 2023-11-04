import '../widgets/Input_field.dart';
import 'package:flutter/material.dart';
import '../widgets/button_elevated.dart';

class RegistrarCuenta extends StatefulWidget {
  const RegistrarCuenta({super.key});

  @override
  State<RegistrarCuenta> createState() => _RegistrarCuentaState();
}

class _RegistrarCuentaState extends State<RegistrarCuenta> {
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
              const Text(
                'Llena los datos para crear tu cuenta',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                cursorColor: Colors.blue,
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  labelText: 'Nombre',
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
                hintText: 'Apellido paterno',
                labelText: 'Apellido paterno',
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              Inputfield(
                hintText: 'Apellido materno',
                labelText: 'Apellido materno',
                onSubmitted: (valor) {},
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Teléfono',
                  labelText: 'Teléfono',
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
                cursorColor: Colors.blue,
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  labelText: 'E-mail',
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
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (valor) {},
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
