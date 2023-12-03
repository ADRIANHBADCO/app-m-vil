import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/models/product.dart';
import 'package:app_veterinaria/src/environment/environment.dart';

class ProductsProvider extends GetConnect {
  String url = Environment.API_URL + 'api/productssn';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<List<Product>> findByCategory(String idCategory) async {
    try {
      Response response =
          await get('$url/findByCategory/$idCategory', headers: {
        'Content-Type': 'application/json',
        'Authorization': userSession.sessionToken ?? ''
      }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

      if (response.statusCode == 401) {
        Get.snackbar('Peticion denegada',
            'Tu usuario no tiene permitido leer esta informacion');
        return [];
      }

      List<Product> products = Product.fromJsonList(response.body ?? []);

      return products;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }

  Future<List<Product>> findByNameAndCategory(
      String idCategory, String name) async {
    try {
      Response response =
          await get('$url/findByNameAndCategory/$idCategory/$name', headers: {
        'Content-Type': 'application/json',
        'Authorization': userSession.sessionToken ?? ''
      }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

      if (response.statusCode == 401) {
        Get.snackbar('Peticion denegada',
            'Tu usuario no tiene permitido leer esta informacion');
        return [];
      }

      List<Product> products = Product.fromJsonList(response.body ?? []);

      return products;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }
}
