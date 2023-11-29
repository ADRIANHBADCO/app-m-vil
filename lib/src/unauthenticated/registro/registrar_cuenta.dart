import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/widgets/Input_field.dart';
import 'package:app_veterinaria/src/widgets/button_elevated.dart';
import 'package:app_veterinaria/src/unauthenticated/registro/register_controller.dart';

class RegistrarCuenta extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context),
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
  RegisterController con = Get.find<RegisterController>();
  Future<void> sendToServer(int value) async {
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
                  TextFormField(
                    controller: con.nombreController,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      labelText: 'Nombre',
                      prefixIcon: const Icon(Icons.person),
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
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Inputfield(
                    controller: con.apaternoController,
                    hintText: 'Apellido paterno',
                    labelText: 'Apellido paterno',
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Inputfield(
                    controller: con.amaternoController,
                    hintText: 'Apellido materno',
                    labelText: 'Apellido materno',
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.telefonoController,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'Teléfono',
                      labelText: 'Teléfono',
                      prefixIcon: const Icon(Icons.phone),
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
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.emailController,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      labelText: 'E-mail',
                      prefixIcon: const Icon(Icons.email),
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
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.direccionController,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'Dirección',
                      labelText: 'Dirección',
                      prefixIcon: const Icon(Icons.location_on),
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
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Inputfield(
                    controller: con.nombreUsuarioController,
                    hintText: 'Nombre de usuario',
                    labelText: 'Nombre usuario',
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DropdownButtonFormField<int>(
                    isDense: true,
                    isExpanded: true,
                    value: con.selectoption,
                    onChanged: (value) {
                      con.selectoption = value!;
                      sendToServer(con.selectoption);
                    },
                    items: const [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('¿Cual es tu color favorito?'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('¿Cual es el nombre de tu primer mascota?'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text(
                            '¿Cual es el nombre de la escuela primaria en la que estudiastes?'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('¿Cual es el nombre de tu mejor amigo/a?'),
                      ),
                      DropdownMenuItem<int>(
                        value: 5,
                        child:
                            Text('¿Cual es el nombre de tu cantante favorito?'),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Pregunta secreta',
                      labelText: 'Pregunta secreta',
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
                        Get.snackbar('Formulario no valido',
                            'Debes ingresar una pregunta');
                        return 'Debes ingresar una pregunta';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Inputfield(
                    controller: con.respuestaController,
                    hintText: 'Respuesta',
                    labelText: 'Respuesta',
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.passwordController,
                    cursorColor: Colors.blue,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock),
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
                    keyboardType: TextInputType.text,
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: con.confirmpassController,
                    cursorColor: Colors.blue,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirmar contraseña',
                      labelText: 'Confirmar contraseña',
                      prefixIcon: const Icon(Icons.lock),
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
                    keyboardType: TextInputType.text,
                    onChanged: (valor) {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Buttonelevated(
                    onPressed: () {
                      RegisterController con = Get.find<RegisterController>();
                      con.register(context);
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

Widget _imageUser(BuildContext context) {
  RegisterController con = Get.find<RegisterController>();
  return SafeArea(
    child: Container(
      margin: EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () => con.showAlertDialog(context),
          child: GetBuilder<RegisterController>(
            builder: (value) => CircleAvatar(
              backgroundImage: con.imageFile != null
                  ? FileImage(con.imageFile!)
                  : AssetImage('images/user_profile.png') as ImageProvider,
              radius: 60,
              backgroundColor: Colors.white,
            ),
          )),
    ),
  );
}

Widget _textYourInfo() {
  return Container(child: const Text('INGRESA ESTA INFORMACION'));
}
