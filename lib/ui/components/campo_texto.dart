import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controlador;
  final String texto;
  final String? prefixo;
  final TextInputType teclado;

  const CampoTexto(
      {Key? key,
      required this.controlador,
      required this.texto,
      this.prefixo,
      this.teclado = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        autofocus: true,
        controller: controlador,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
          prefixText: prefixo,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(fontSize: 20),
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
