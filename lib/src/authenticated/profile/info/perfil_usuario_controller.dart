import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';

class PerfilUsuarioController extends GetxController {
  User user = User.fromJson(GetStorage().read('user'));
}
