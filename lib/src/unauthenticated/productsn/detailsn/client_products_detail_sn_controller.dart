import 'package:get/get.dart';
import 'package:app_veterinaria/src/models/product.dart';
import 'package:app_veterinaria/src/unauthenticated/productsn/listsn/client_products_list_sn_controller.dart';

class ClientProductsDetailSnController extends GetxController {
  List<Product> selectedProducts = [];
  ClientProductsListSnController productsListController = Get.find();
}

void addToBag(Product product, var price, var counter) {
  if (counter.value > 0) {
    // VALIDAR SI EL PRODUCTO YA FUE AGREGADO CON GETSTORAGE A LA SESION DEL DISPOSITIVO
  }
}
