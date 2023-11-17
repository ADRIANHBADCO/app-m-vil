import '../widgets/Input_field.dart';
import '../widgets/input_fecha.dart';
import 'package:flutter/material.dart';
import '../widgets/button_elevated.dart';
import '../widgets/button_dropdown.dart';

class RegistrarCitas extends StatefulWidget {
  const RegistrarCitas({super.key});

  @override
  State<RegistrarCitas> createState() => _RegistrarCitasState();
}

class _RegistrarCitasState extends State<RegistrarCitas> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _propietarioController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _mascotaController = TextEditingController();
  final TextEditingController _razaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _otroController = TextEditingController();

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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _propietarioController,
                      cursorColor: Colors.blue,
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'Nombre del propietario',
                        labelText: 'Nombre propietario',
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
                      validator: (value) {
                        value ??= '';
                        if (value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _telefonoController,
                      cursorColor: Colors.blue,
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
                      validator: (value) {
                        value ??= '';
                        if (value.isEmpty) {
                          return 'Este campo es obligatorio';
                        } else if (value.length != 10) {
                          return 'El número de teléfono debe tener 10 dígitos';
                        } else if (value.contains(RegExp(r'[a-z]')) ||
                            value.contains(RegExp(r'[A-Z]'))) {
                          return 'El número de teléfono no debe tener letras';
                        } else if (value.contains('-')) {
                          return 'El número de teléfono no debe tener números negativos';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Inputfield(
                      controller: _mascotaController,
                      hintText: 'Nombre de la mascota',
                      labelText: 'Nombre mascota',
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Inputfield(
                      controller: _razaController,
                      hintText: 'Raza de la mascota',
                      labelText: 'Raza mascota',
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _edadController,
                      cursorColor: Colors.blue,
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
                      validator: (value) {
                        value ??= '';
                        if (value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
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
                    const InputFecha(),
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
                      onChanged: (value) {
                        setState(() {
                          if (value == 'Otro') {
                            // Mostrar el campo de entrada solo si la opción 'Otro' está seleccionada
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                      const Text('Especifique otro servicio'),
                                  content: TextFormField(
                                    controller: _otroController,
                                    // Otros atributos de TextFormField...
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          minimumSize: const Size(100, 50)),
                                      child: const Text(
                                        'Aceptar',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
                      labelText: 'Tipo de servicio',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Buttonelevated(
                      onPressed: () {
                        _submitForm();
                      },
                      text: 'Registrar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // La validación pasa, puedes realizar acciones adicionales aquí
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Felicidades!. Haz concluido tu registro.'),
        ),
      );
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FormCitasTwo(),
        ),
      );*/
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              '¡Algo salio mal!. Verifica que hayas llenado correctamente todos los campos.'),
        ),
      );
    }
  }
}
