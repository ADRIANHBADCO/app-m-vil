import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const Inputfield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
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
      validator: (value) {
        value ??= '';
        if (value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
