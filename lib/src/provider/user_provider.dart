import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/models/response_api.dart';
import 'package:app_veterinaria/src/environment/environment.dart';

class UserProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';
  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  Future<List<User>> getAll() async {
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

      List<User> users = User.fromJsonList(response.body);

      return users;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }

  Future<Response> create(User user) async {
    try {
      Response response = await post('$url/create', user.toJson(),
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

  Future<Stream> createWithImage(User user, File image) async {
    try {
      Uri uri = Uri.http(Environment.API_URL_OLD, '/api/users/createWithImage');
      final request = http.MultipartRequest('POST', uri);
      request.files.add(http.MultipartFile('image',
          http.ByteStream(image.openRead().cast()), await image.length(),
          filename: basename(image.path)));
      request.fields['user'] = json.encode(user);
      final response = await request.send();
      return response.stream.transform(utf8.decoder);
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }

  /*
  * GET X
   */
  Future<ResponseApi> createUserWithImageGetX(User user, File image) async {
    try {
      FormData form = FormData({
        'image': MultipartFile(image, filename: basename(image.path)),
        'user': json.encode(user)
      });
      Response response = await post('$url/createWithImage', form);

      if (response.body == null) {
        Get.snackbar('Error en la peticion', 'No se pudo crear el usuario');
        return ResponseApi();
      }
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    try {
      Response response = await post('$url/login', {
        'email': email,
        'password': password
      }, headers: {
        'Content-Type': 'application/json'
      }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

      if (response.body == null) {
        Get.snackbar('Error', 'No se pudo ejecutar la peticion');
        return ResponseApi();
      }

      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
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
