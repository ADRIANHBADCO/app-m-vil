import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_veterinaria/src/models/product.dart';
import 'package:app_veterinaria/src/models/category.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:app_veterinaria/src/provider/products_sn_provider.dart';
import 'package:app_veterinaria/src/provider/categories_sn_provider.dart';
import 'package:app_veterinaria/src/unauthenticated/productsn/detailsn/client_products_detail_sn_page.dart';

class ClientProductsListSnController extends GetxController {
  CategoriesProvider categoriesProvider = CategoriesProvider();
  ProductsProvider productsProvider = ProductsProvider();

  List<Product> selectedProducts = [];

  List<Category> categories = <Category>[].obs;
  var items = 0.obs;

  var productName = ''.obs;
  Timer? searchOnStoppedTyping;

  ClientProductsListSnController() {
    getCategories();
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
    Get.toNamed('/client/loguin/users');
  }

  void openBottomSheet(BuildContext context, Product product) async {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientProductsDetailSnPage(product: product),
    );
  }
}
