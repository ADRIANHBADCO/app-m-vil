import 'package:flutter/material.dart';

class Iconcontainer extends StatelessWidget {
  final String url;

  const Iconcontainer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: 150.0,
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage(url),
      ),
    );
  }
}
