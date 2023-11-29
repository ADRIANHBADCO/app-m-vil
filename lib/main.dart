import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/unauthenticated/home_signup.dart';
import 'package:app_veterinaria/src/authenticated/home/home_signin.dart';
import 'package:app_veterinaria/src/unauthenticated/registro/registrar_cuenta.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    print('EL TOKEN DE SESION DEL USUARIO: ${userSession.sessionToken}');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.idusuario != null ? '/homesignin' : '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeSignup()),
        GetPage(name: '/register', page: () => RegistrarCuenta()),
        GetPage(name: '/homesignin', page: () => HomeSignin()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Get.key,
    );
  }
}
