// Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/IMCController.dart';

class IMCForm extends StatefulWidget {
  final IMCController controller;

  const IMCForm({required this.controller, Key? key}) : super(key: key);

  @override
  _IMCFormState createState() => _IMCFormState();
}

class _IMCFormState extends State<IMCForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: widget.controller.pesoController,
          decoration: const InputDecoration(labelText: 'Peso (kg)', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.controller.alturaController,
          decoration: const InputDecoration(labelText: 'Altura (m)', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.controller.calcular();
            });
          },
          child: const Text('Calcular'),
        ),
        const SizedBox(height: 16),
        Text(widget.controller.resultado, style: const TextStyle(fontSize: 18)),
        Text(widget.controller.mensagemIMC, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}