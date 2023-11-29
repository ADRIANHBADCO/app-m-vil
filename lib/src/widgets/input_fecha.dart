import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/citas/citas_controller.dart';

class InputFecha extends StatefulWidget {
    CitasController controller = Get.put(CitasController());

  @override
  State<InputFecha> createState() => _InputFechaState();
}

class _InputFechaState extends State<InputFecha> {
  DateTime currentDate = DateTime.now();
  TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    CitasController con = Get.find<CitasController>();

    Future<void> getCurrent(BuildContext context) async {
      DateTime currentDate = DateTime.now();
      final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: currentDate.add(const Duration(days: 365 * 2)),
      );

      if (selectedDate != null) {
        setState(() {
          // Asigna selectedDate (DateTime) a currentDate (DateTime)
          currentDate = selectedDate;
          // Puedes convertirlo a String aquí si es necesario
          textController.text = DateFormat('dd-MM-yyyy').format(currentDate);
        });
      }
    }

    return TextFormField(
      enableInteractiveSelection: false,
      controller: textController,
      decoration: InputDecoration(
        //hintText: 'Fecha cita',
        labelText: 'Fecha de la cita',
        suffixIcon: const Icon(Icons.date_range_outlined),
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        getCurrent(context);
      },
    );
  }
}
