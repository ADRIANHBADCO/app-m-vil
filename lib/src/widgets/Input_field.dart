import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final String hintText;
  final String labelText;
  final ValueChanged<String> onSubmitted;

  const Inputfield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onSubmitted: onSubmitted,
    );
  }
}
