import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_veterinaria/src/models/user.dart';
import 'package:app_veterinaria/src/models/product.dart';
import 'package:app_veterinaria/src/models/category.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:app_veterinaria/src/provider/products_provider.dart';
import 'package:app_veterinaria/src/provider/categories_provider.dart';
import 'package:app_veterinaria/src/authenticated/products/detail/client_products_detail_page.dart';

class ClientProductsListController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
  CategoriesProvider categoriesProvider = CategoriesProvider();
  ProductsProvider productsProvider = ProductsProvider();

  List<Product> selectedProducts = [];

  List<Category> categories = <Category>[].obs;
  var items = 0.obs;

  var productName = ''.obs;
  Timer? searchOnStoppedTyping;

  ClientProductsListController() {
    getCategories();
    if (GetStorage().read('shopping_bag') != null) {
      if (GetStorage().read('shopping_bag') is List<Product>) {
        selectedProducts = GetStorage().read('shopping_bag');
      } else {
        selectedProducts =
            Product.fromJsonList(GetStorage().read('shopping_bag'));
      }

      selectedProducts.forEach((p) {
        items.value = items.value + (p.quantity!);
      });
    }
     print('USUARIO DE SESION: ${user.toJson()}');
  }

  void signOut() {
    GetStorage().remove('user');

    Get.offNamedUntil('/', (route) => false);
  }

  void onChangeText(String text) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel();
    }

    searchOnStoppedTyping = Timer(duration, () {
      productName.value = text;
      print('TEXTO COMPLETO: ${text}');
    });
  }

  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }

  Future<List<Product>> getProducts(
      String idCategory, String productName) async {
    if (productName.isEmpty) {
      return await productsProvider.findByCategory(idCategory);
    } else {
      return await productsProvider.findByNameAndCategory(
          idCategory, productName);
    }
  }

  void goToOrderCreate() {
    Get.toNamed('/client/orders/create');
  }

  void openBottomSheet(BuildContext context, Product product) async {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientProductsDetailPage(product: product),
    );
  }
}
