import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _tituloController = TextEditingController();
  final _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 109, 77, 181),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
        ],
      ),
      body: ListView(
        children: [
          CampoTexto(
            texto: "Seu nome",
            controlador: _nomeController,
          ),
          CampoTexto(
            controlador: _emailController,
            texto: "Seu Email",
            teclado: TextInputType.emailAddress,
            prefixo: "",
          ),
          CampoTexto(
              controlador: _tituloController, texto: "Titulo"),
          CampoTexto(
              controlador: _mensagemController, texto: "Mensagem"),
          Botao(texto: "Enviar mensagem", clique: enviarEmail)
        ],
      ),
    );
  }

  void enviarEmail() async {
    const usuario = '';
    const senha = "";

    // ignore: deprecated_member_use
    final smtpServer = gmail(usuario, senha);

    final mensagem = Message()
      ..from = const Address(usuario, "Contato")
      ..recipients.add(usuario)
      ..subject = _tituloController.text
      ..text = """Nome: ${_nomeController.text},
          E-mail: ${_emailController.text},
          Mensagem: ${_mensagemController.text}""";

    await send(mensagem, smtpServer);

    setState(() {
      _nomeController.clear();
      _emailController.clear();
      _tituloController.clear();
      _mensagemController.clear();
    });
  }
  
}
