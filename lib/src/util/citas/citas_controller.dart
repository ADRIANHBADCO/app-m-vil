import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/models/cita.dart';
import 'package:app_veterinaria/src/provider/cita_provider.dart';

class CitasController extends GetxController {
  final TextEditingController nombreMascotaController = TextEditingController();
  final TextEditingController razaMascotaController = TextEditingController();
  final TextEditingController nombrePropietarioController =
      TextEditingController();
  final TextEditingController telefonoPropietarioController =
      TextEditingController();
  final TextEditingController edadMascotaController = TextEditingController();
  String sexoMascotaController = "Macho";
  TextEditingController fechaCitaController = TextEditingController();
  int horaCitaController = 1;
  String razonCitaController = "Estética canina";
  String estadoCitaController = "En espera";
  int idusuarioController = 1;

  CitaProvider citasProvider = CitaProvider();

  void register() async {
    String nombreMascota = nombreMascotaController.text;
    String razaMascota = razaMascotaController.text;
    String nombrePropietario = nombrePropietarioController.text;
    String telefonoPropietario = telefonoPropietarioController.text;
    String edadMascota = edadMascotaController.text;
    String sexoMascota = sexoMascotaController;
    String fechaCita = fechaCitaController.text;
    int horaCita = horaCitaController;
    String estadoCita = "En espera";
    String razonCita = razonCitaController;
    int idusuario = idusuarioController;

    print('Email ${edadMascota}');
    print('Password ${idusuario}');

    if (isValidForm(
        nombreMascota, telefonoPropietario, edadMascota, fechaCita)) {
      Cita cita = Cita(
          nombreMascota: nombreMascota,
          razaMascota: razaMascota,
          nombrePropietario: nombrePropietario,
          telefonoPropietario: telefonoPropietario,
          edadMascota: edadMascota,
          sexoMascota: sexoMascota,
          fechaCita: fechaCita,
          horaCita: horaCita,
          razonCita: razonCita,
          estadoCita: estadoCita,
          idusuario: idusuario);

      Response response = await citasProvider.create(cita);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario valido', 'El registro se realizo correctamente');
    }
  }

  bool isValidForm(String nombrePropietario, String telefonoPropietario,
      String edadMascota, String fechaCita) {
    /*if (nombre.isNotEmpty) {
      String nombreCapitalizado = nombre[0].toUpperCase() + nombre.substring(1);
      nombre = nombreCapitalizado;
    }*/
    if (nombrePropietario.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
      return false;
    } else if (nombrePropietario.length < 3) {
      Get.snackbar(
          'Formulario no valido', 'Verifca que este correcto tu nombre');
      return false;
    }
    if (telefonoPropietario.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debes ingresar tu numero telefonico');
      return false;
    } else if (telefonoPropietario.length != 10) {
      Get.snackbar('Formulario no valido',
          'El número de teléfono debe tener 10 dígitos');
      return false;
    } else if (telefonoPropietario.contains('-')) {
      Get.snackbar('Formulario no valido',
          'El número de teléfono no debe tener números negativos');
      return false;
    }

    if (fechaCita.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar una fecha');
      return false;
    }
    return true;
  }
}
