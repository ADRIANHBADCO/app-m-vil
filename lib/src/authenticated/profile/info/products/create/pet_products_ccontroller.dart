import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app_veterinaria/src/models/product.dart';
import 'package:app_veterinaria/src/models/category.dart';
import 'package:app_veterinaria/src/models/response_api.dart';
import 'package:app_veterinaria/src/provider/products_provider.dart';
import 'package:app_veterinaria/src/provider/categories_provider.dart';

class PetProductsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  CategoriesProvider categoriesProvider = CategoriesProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile1;
  File? imageFile2;
  File? imageFile3;
  /*File? imageFile4;
  File? imageFile5;
  File? imageFile6;*/

  var idCategory = ''.obs;
  List<Category> categories = <Category>[].obs;
  ProductsProvider productsProvider = ProductsProvider();

  PetProductsController() {
    getCategories();
  }

  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }

  void createProduct(BuildContext context) async {
    String name = nameController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    print('NAME: ${name}');
    print('DESCRIPTION: ${description}');
    print('PRICE: ${price}');
    print('ID CATEGORY: ${idCategory}');
    ProgressDialog progressDialog = ProgressDialog(context: context);

    String nameCapitalizado = name[0].toUpperCase() + name.substring(1);
    name = nameCapitalizado;
    String descriptionCapitalizado =
        description[0].toUpperCase() + description.substring(1);
    description = descriptionCapitalizado;

    if (isValidForm(name, description, price)) {
      Product product = Product(
          name: nameCapitalizado,
          description: descriptionCapitalizado,
          price: double.parse(price),
          idCategory: idCategory.value);
      progressDialog.show(max: 100, msg: 'Espere un momento...');

      List<File> images = [];
      images.add(imageFile1!);
      images.add(imageFile2!);
      images.add(imageFile3!);
      /*images.add(imageFile4!);
      images.add(imageFile5!);
      images.add(imageFile6!);*/

      Stream stream = await productsProvider.create(product, images);
      stream.listen((res) {
        progressDialog.close();

        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
        Get.snackbar('Proceso terminado', responseApi.message ?? '');
        if (responseApi.success == true) {
          clearForm();
        }
      });
    }
  }

  bool isValidForm(String name, String description, String price) {
    if (name.isEmpty) {
      Get.snackbar('Fomulario no valido', 'Ingresa el nombre del producto');
      return false;
    }
    if (description.isEmpty) {
      Get.snackbar(
          'Fomulario no valido', 'Ingresa la descripcion del producto');
      return false;
    }
    if (price.isEmpty) {
      Get.snackbar('Fomulario no valido', 'Ingresa el precio del producto');
      return false;
    }
    if (idCategory.value == '') {
      Get.snackbar(
          'Fomulario no valido', 'Debes seleccionar la categoria del producto');
      return false;
    }

    if (imageFile1 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 1 del producto');
      return false;
    }
    if (imageFile2 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 2 del producto');
      return false;
    }
    if (imageFile3 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 3 del producto');
      return false;
    }

    /*if (imageFile4 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 4 del producto');
      return false;
    }
    if (imageFile5 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 5 del producto');
      return false;
    }
    if (imageFile6 == null) {
      Get.snackbar(
          'Fomulario no valido', 'Selecciona la imagen numero 6 del producto');
      return false;
    }*/

    return true;
  }

  Future selectImage(ImageSource imageSource, int numberFile) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      if (numberFile == 1) {
        imageFile1 = File(image.path);
      } else if (numberFile == 2) {
        imageFile2 = File(image.path);
      } else if (numberFile == 3) {
        imageFile3 = File(image.path);
      } /* else if (numberFile == 4) {
        imageFile4 = File(image.path);
      } else if (numberFile == 5) {
        imageFile5 = File(image.path);
      } else if (numberFile == 6) {
        imageFile6 = File(image.path);
      }*/

      update();
    }
  }

  void showAlertDialog(BuildContext context, int numberFile) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery, numberFile);
        },
        child: Text(
          'GALERIA',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera, numberFile);
        },
        child: Text(
          'CAMARA',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void clearForm() {
    nameController.text = '';
    descriptionController.text = '';
    priceController.text = '';
    imageFile1 = null;
    imageFile2 = null;
    imageFile3 = null;
    /*imageFile4 = null;
    imageFile5 = null;
    imageFile6 = null;*/
    idCategory.value = '';
    update();
  }
}
