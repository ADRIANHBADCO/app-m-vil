import 'package:flutter/material.dart';

//statelessWidget

class FormRegisterPage extends StatelessWidget {
  const FormRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta nueva'),
      ),
      body: const SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
