// lib/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:imc_calculo/core/usecases/calcular_imc.dart';

class HomePage extends StatefulWidget {
  final CalcularIMC calcularIMC;

  HomePage({required this.calcularIMC});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _resultado = '';
  String _mensagemIMC = '';

  void _calcularIMC() {
    final double peso = double.tryParse(_pesoController.text) ?? 0;
    final double altura = double.tryParse(_alturaController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      final double imc = widget.calcularIMC.executar(peso, altura);
      _mensagemIMC = _tabelaIMC(imc);
      setState(() {
        _resultado = 'IMC: ${imc.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira valores válidos.';
        _mensagemIMC = '';
      });
    }
  }

  String _tabelaIMC(double imc) {
    if (imc < 16) {
      return "Baixo peso muito grave";
    } else if (imc >= 16 && imc < 16.99) {
      return "Baixo peso grave";
    } else if (imc >= 17 && imc < 18.49) {
      return "Baixo Peso";
    } else if (imc >= 18.50 && imc < 24.99) {
      return "Peso normal";
    } else if (imc >= 25 && imc < 29.99) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 34.99) {
      return "Obesidade grau 1";
    } else if (imc >= 35 && imc < 39.99) {
      return "Obesidade grau 2";
    } else {
      return "Obesidade grau 3 (obesidade mórbida)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pesoController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _alturaController,
              decoration: InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular'),
            ),
            Text(_resultado),
            Text(_mensagemIMC),
          ],
        ),
      ),
    );
  }
}
