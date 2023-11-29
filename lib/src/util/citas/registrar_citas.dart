import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/widgets/input_fecha.dart';
import 'package:app_veterinaria/src/widgets/Input_field.dart';
import 'package:app_veterinaria/src/widgets/button_elevated.dart';
import 'package:app_veterinaria/src/util/citas/citas_controller.dart';

class RegistrarCitas extends StatelessWidget {
  CitasController controller = Get.put(CitasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(),
          _buttonBack(),
        ],
      ),
    );
  }
}

Widget _buttonBack() {
  return SafeArea(
      child: Container(
    margin: EdgeInsets.only(left: 20),
    child: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        //size: 30,
      ),
    ),
  ));
}

Widget _backgroundCover(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.35,
    color: const Color(0xFFFB0404),
  );
}

Widget _boxForm(BuildContext context) {
  CitasController con = Get.find<CitasController>();

  Future<void> sendToServer(int value) async {
    // Send value to server
    print('Sending value to server: $value');
  }

  Future<void> sendToServerString(String value) async {
    // Send value to server
    print('Sending value to server: $value');
  }

  return Container(
    margin: const EdgeInsets.only(top: 170.0),
    height: MediaQuery.of(context).size.height * 0.99,
    child: Card(
      margin: const EdgeInsets.all(16.0), // Margen alrededor del Card
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: <Widget>[
          Column(
            children: [
              _textYourInfo(),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                  child: Column(
                children: <Widget>[
                  Inputfield(
                    controller: con.nombreMascotaController,
                    hintText: 'Nombre de la mascota',
                    labelText: 'Nombre mascota',
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Inputfield(
                    controller: con.razaMascotaController,
                    hintText: 'Raza de la mascota',
                    labelText: 'Raza mascota',
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.nombrePropietarioController,
                    cursorColor: Colors.blue,
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
                    keyboardType: TextInputType.name,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.telefonoPropietarioController,
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.edadMascotaController,
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DropdownButtonFormField<String>(
                    isDense: true,
                    isExpanded: true,
                    value: con.sexoMascotaController,
                    onChanged: (value) {
                      con.sexoMascotaController = value!;
                      sendToServerString(con.sexoMascotaController);
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Macho',
                        child: Text('Macho'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Hembra',
                        child: Text('Hembra'),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Sexo de la mascota',
                      labelText: 'Sexo de la mascota',
                      labelStyle: const TextStyle(color: Colors.blue),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    validator: (value) {
                      if (value == null) {
                        // Mostrar el snackbar
                        Get.snackbar('Formulario no valido',
                            'Debes ingresar el sexo de tu mascota');
                        return 'Debes ingresar  el sexo de tu mas';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  InputFecha(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DropdownButtonFormField<int>(
                    isDense: true,
                    isExpanded: true,
                    value: con.horaCitaController,
                    onChanged: (value) {
                      con.horaCitaController = value!;
                      sendToServer(con.horaCitaController);
                    },
                    items: const [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('08:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('09:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('10:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('11:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 5,
                        child: Text('12:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 6,
                        child: Text('01:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 7,
                        child: Text('02:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 8,
                        child: Text('03:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 9,
                        child: Text('04:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 10,
                        child: Text('05:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 10,
                        child: Text('06:00:00'),
                      ),
                      DropdownMenuItem<int>(
                        value: 10,
                        child: Text('07:00:00'),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Hora de la cita',
                      labelText: 'Hora cita',
                      labelStyle: const TextStyle(color: Colors.blue),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    validator: (value) {
                      if (value == null || value < 1) {
                        // Mostrar el snackbar
                        Get.snackbar(
                            'Formulario no valido', 'Debes ingresar una hora');
                        return 'Debes ingresar una hora';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DropdownButtonFormField<String>(
                    isDense: true,
                    isExpanded: true,
                    value: con.razonCitaController,
                    onChanged: (value) {
                      con.razonCitaController = value!;
                      sendToServerString(con.razonCitaController);
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Estética canina',
                        child: Text('Estética canina'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Ultrasonido',
                        child: Text('Ultrasonido'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Cirugia',
                        child: Text('Cirugia'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Consulta general',
                        child: Text('Consulta general'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Análisis clínicos',
                        child: Text('Análisis clínicos'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Radiografía',
                        child: Text('Radiografía'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Cremación',
                        child: Text('Cremación'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Otro',
                        child: Text('Otro'),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Tipo de servicio',
                      labelText: 'Tipo de servicio',
                      labelStyle: const TextStyle(color: Colors.blue),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    validator: (value) {
                      if (value == null) {
                        // Mostrar el snackbar
                        Get.snackbar('Formulario no valido',
                            'Debes ingresar el tipo de servicio');
                        return 'Debes ingresar el tipo de servicio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Buttonelevated(
                    onPressed: () {
                      CitasController con = Get.find<CitasController>();
                      con.register();
                    },
                    text: 'Registrar',
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _imageUser() {
  return SafeArea(
    child: Container(
      margin: EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/user_profile.png',
          ),
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    ),
  );
}

Widget _textYourInfo() {
  return Container(child: const Text('INGRESA ESTA INFORMACION'));
}
