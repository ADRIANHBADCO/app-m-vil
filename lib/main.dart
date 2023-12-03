import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/unauthenticated/login/iniciar_cuenta.dart';
import 'package:app_veterinaria/src/unauthenticated/registro/registrar_cuenta.dart';
import 'package:app_veterinaria/src/authenticated/orders/create/client_orders_create_page.dart';
import 'package:app_veterinaria/src/authenticated/products/list/client_products_list_page.dart';
import 'package:app_veterinaria/src/unauthenticated/productsn/listsn/client_products_list_sn_page.dart';

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
        GetPage(name: '/', page: () =>  ClientProductsListSnPage()),
        GetPage(name: '/register', page: () => RegistrarCuenta()),
        GetPage(name: '/homesignin', page: () => ClientProductsListPage()),
        GetPage(
            name: '/client/orders/create',
            page: () => ClientOrdersCreatePage()),
        GetPage(
            name: '/client/loguin/users', page: () => IniciarCuenta()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Get.key,
    );
  }
}
