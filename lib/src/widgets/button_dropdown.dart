import 'package:flutter/material.dart';

class Buttondropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;
  final String labelText;

  const Buttondropdown(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.labelText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.blue),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      borderRadius: BorderRadius.circular(20.0),
    );
  }
}
