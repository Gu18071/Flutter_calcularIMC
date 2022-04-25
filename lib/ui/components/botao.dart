import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback clique;

  const Botao({Key? key, required this.texto, required this.clique})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ElevatedButton(
        onPressed: clique,
        child: Text(texto),
         style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 16, 215, 152),
              shadowColor: Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(120, 50), 
               ),
      ),
    );
  }
}
