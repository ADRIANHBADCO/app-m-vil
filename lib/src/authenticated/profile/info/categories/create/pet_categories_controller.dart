import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_veterinaria/src/models/category.dart';
import 'package:app_veterinaria/src/models/response_api.dart';
import 'package:app_veterinaria/src/provider/categories_provider.dart';

class PetCategoriesController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  CategoriesProvider categoriesProvider = CategoriesProvider();

  void createCategory() async {
    String name = nameController.text;

    String description = descriptionController.text;

    print('NAME: ${name}');

    print('DESCRIPTION: ${description}');

    if (name.isNotEmpty && description.isNotEmpty) {
      String nameCapitalizado = name[0].toUpperCase() + name.substring(1);

      name = nameCapitalizado;

      String descriptionCapitalizado =
          description[0].toUpperCase() + description.substring(1);

      description = descriptionCapitalizado;

      Category category = Category(
          name: nameCapitalizado, description: descriptionCapitalizado);

      ResponseApi responseApi = await categoriesProvider.create(category);

      Get.snackbar('Proceso terminado', responseApi.message ?? '');

      if (responseApi.success == true) {
        clearForm();
      }
    } else {
      Get.snackbar('Formulario no valido',
          'Ingresa todos los campos para crear la categoria');
    }
  }

  void clearForm() {
    nameController.text = '';

    descriptionController.text = '';
  }
}
