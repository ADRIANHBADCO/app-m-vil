import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/models/cita.dart';
import 'package:app_veterinaria/src/environment/environment.dart';

class CitaProvider extends GetConnect {
  String url = Environment.API_URL + 'api/citas';
    User userSession = User.fromJson(GetStorage().read('user') ?? {});

    Future<List<Cita>> getAll() async {
    try {
      Response response = await get('$url/getAll', headers: {
        'Content-Type': 'application/json',
        'Authorization': userSession.sessionToken ?? ''
      }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

      if (response.statusCode == 401) {
        Get.snackbar('Peticion denegada',
            'Tu usuario no tiene permitido leer esta informacion');

        return [];
      }

      List<Cita> categories = Cita.fromJsonList(response.body);

      return categories;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }

  Future<Response> create(Cita cita) async {
    try {
      Response response = await post('$url/create', cita.toJson(),
          headers: {'Content-Type': 'application/json'});

      return response;
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
