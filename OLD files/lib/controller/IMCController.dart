// Controller
import 'package:flutter/cupertino.dart';

import '../core/usecases/calcular_imc.dart';

class IMCController {
  final CalcularIMC calcularIMC;
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String resultado = '';
  String mensagemIMC = '';

  IMCController(this.calcularIMC);

  void calcular() {
    final double peso = double.tryParse(pesoController.text) ?? 0;
    final double altura = double.tryParse(alturaController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      final double imc = calcularIMC.executar(peso, altura);
      mensagemIMC = _tabelaIMC(imc);
      resultado = 'IMC: ${imc.toStringAsFixed(2)}';
    } else {
      resultado = 'Por favor, insira valores válidos.';
      mensagemIMC = '';
    }
  }

  String _tabelaIMC(double imc) {
    if (imc < 16) return "Baixo peso muito grave";
    if (imc < 16.99) return "Baixo peso grave";
    if (imc < 18.49) return "Baixo Peso";
    if (imc < 24.99) return "Peso normal";
    if (imc < 29.99) return "Sobrepeso";
    if (imc < 34.99) return "Obesidade grau 1";
    if (imc < 39.99) return "Obesidade grau 2";
    return "Obesidade grau 3 (obesidade mórbida)";
  }
}

