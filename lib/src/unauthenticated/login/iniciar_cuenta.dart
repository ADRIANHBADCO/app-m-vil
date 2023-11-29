import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/widgets/button_elevated.dart';
import 'package:app_veterinaria/src/unauthenticated/login/login_controller.dart';

class IniciarCuenta extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        //POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          imageCover(),
          _buttonBack(),
        ],
      ),
    );
  }
}

Widget _backgroundCover(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.42,
    color: const Color(0xFFFB0404),
  );
}

Widget _boxForm(BuildContext context) {
  LoginController con = Get.find<LoginController>();
  return Container(
    margin: const EdgeInsets.only(top: 180),
    height: MediaQuery.of(context).size.height * 0.50,
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
                    controller: con.emailController,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
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
                  Buttonelevated(
                    onPressed: () {
                      LoginController con = Get.find<LoginController>();
                      con.login();
                    },
                    text: 'Iniciar sesión',
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

Widget _textYourInfo() {
  return Container(child: const Text('INGRESA ESTA INFORMACION'));
}

Widget _textDontHaveAccount() {
  return Row(
    //UBICAR ELEMENTOS UNO AL OTRO DE MANERA (HORIZONTAL)
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '¿No tienes cuenta?',
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
      SizedBox(
        width: 7,
      ),
      GestureDetector(
        onTap: () {
          LoginController con = Get.find<LoginController>();
          con.goToRegisterPage();
        },
        child: Text('Registrate Aqui',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17)),
      ),
    ],
  );
}

Widget imageCover() {
  return SafeArea(
    child: Container(
      margin: EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/logocirculo.png',
          ),
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    ),
  );
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
