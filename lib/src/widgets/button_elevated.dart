import 'package:flutter/material.dart';

class Buttonelevated extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Buttonelevated({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: const Size(360, 55)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
