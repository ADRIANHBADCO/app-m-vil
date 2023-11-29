import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app_veterinaria/src/models/response_api.dart';
import 'package:app_veterinaria/src/provider/user_provider.dart';

class RegisterController extends GetxController {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apaternoController = TextEditingController();
  final TextEditingController amaternoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController nombreUsuarioController = TextEditingController();
  int selectoption = 1;
  final TextEditingController respuestaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  UserProvider usersProvider = UserProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register(BuildContext context) async {
    String nombre = nombreController.text;
    String apaterno = apaternoController.text;
    String amaterno = amaternoController.text;
    String telefono = telefonoController.text;
    String email = emailController.text.trim();
    String direccion = direccionController.text;
    String nombreUsuario = nombreUsuarioController.text;
    int idpreguntasecreta = selectoption;
    String respuesta = respuestaController.text;
    String password = passwordController.text.trim();
    String confirmpassword = confirmpassController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(
        nombre,
        apaterno,
        amaterno,
        telefono,
        email,
        direccion,
        nombreUsuario,
        idpreguntasecreta,
        respuesta,
        password,
        confirmpassword)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando datos...');
      String nombreCapitalizado = nombre[0].toUpperCase() + nombre.substring(1);
      nombre = nombreCapitalizado;
      String apaternoCapitalizado =
          apaterno[0].toUpperCase() + apaterno.substring(1);
      apaterno = apaternoCapitalizado;
      String amaternoCapitalizado =
          amaterno[0].toUpperCase() + amaterno.substring(1);
      amaterno = amaternoCapitalizado;
      String direccionCapitalizado =
          direccion[0].toUpperCase() + direccion.substring(1);
      direccion = direccionCapitalizado;
      String usuarioCapitalizado =
          nombreUsuario[0].toUpperCase() + nombreUsuario.substring(1);
      nombreUsuario = usuarioCapitalizado;
      User user = User(
          nombre: nombreCapitalizado,
          apaterno: apaternoCapitalizado,
          amaterno: amaternoCapitalizado,
          telefono: telefono,
          email: email,
          direccion: direccionCapitalizado,
          nombreUsuario: usuarioCapitalizado,
          idpreguntasecreta: idpreguntasecreta,
          respuesta: respuesta,
          password: password);

      Stream stream = await usersProvider.createWithImage(user, imageFile!);
      stream.listen((res) {
        progressDialog.close();
        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        if (responseApi.success == true) {
          GetStorage()
              .write('user', responseApi.data); // DATOS DEL USUARIO EN SESION
          goToHomeSignin();
        } else {
          Get.snackbar('Registro fallido', responseApi.message ?? '');
        }
      });
    }
  }

  void goToHomeSignin() {
    Get.offNamedUntil('/homesignin', (route) => false);
  }

  bool isValidForm(
      String nombre,
      String apaterno,
      String amaterno,
      String telefono,
      String email,
      String direccion,
      String nombreUsuario,
      int idpreguntasecreta,
      String respuesta,
      String password,
      String confirmPassword) {
    /*if (nombre.isNotEmpty) {
      String nombreCapitalizado = nombre[0].toUpperCase() + nombre.substring(1);
      nombre = nombreCapitalizado;
    }*/

    if (nombre.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
      return false;
    } else if (nombre.length < 3) {
      Get.snackbar(
          'Formulario no valido', 'Verifca que este correcto tu nombre');
      return false;
    }

    if (apaterno.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debes ingresar tu apellido paterno');
      return false;
    } else if (apaterno.length < 3) {
      Get.snackbar('Formulario no valido',
          'Verifca que este correcto tu apellido paterno');
      return false;
    }

    if (amaterno.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debes ingresar tu apellido materno');
      return false;
    } else if (amaterno.length < 3) {
      Get.snackbar('Formulario no valido',
          'Verifca que este correcto tu apellido materno');
      return false;
    }

    if (telefono.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debes ingresar tu numero telefonico');
      return false;
    } else if (telefono.length != 10) {
      Get.snackbar('Formulario no valido',
          'El número de teléfono debe tener 10 dígitos');
      return false;
    } else if (telefono.contains('-')) {
      Get.snackbar('Formulario no valido',
          'El número de teléfono no debe tener números negativos');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (direccion.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu dirección');
      return false;
    } else if (direccion.length < 3) {
      Get.snackbar(
          'Formulario no valido', 'Verifca que este correcto tu dirección');
      return false;
    }
    if (nombreUsuario.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu usuario');
      return false;
    }

    if (respuesta.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar la respuesta');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    } else if (password.length != 8) {
      Get.snackbar(
          'Formulario no valido', 'La contraseña debe contener 8 caracteres');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido',
          'Debes ingresar la confirmacion del password');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'los password no coinciden');
      return false;
    }
    if (imageFile == null) {
      Get.snackbar(
          'Formulario no valido', 'Debes seleccionar una imagen de perfil');
      return false;
    }

    return true;
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text(
          'GALERIA',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text(
          'CAMARA',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
