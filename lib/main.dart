// lib/main.dart

import 'package:flutter/material.dart';
import 'package:imc_calculo/color_schemes.g.dart';
import 'presentation/pages/home_page.dart';
import 'core/usecases/calcular_imc.dart';
import 'data/repositories/imc_repository.dart';

void main() {
  final IMCRepository imcRepository = IMCRepository();
  final CalcularIMC calcularIMC = CalcularIMC(imcRepository);

  runApp(MyApp(calcularIMC: calcularIMC));
}

class MyApp extends StatelessWidget {
  final CalcularIMC calcularIMC;

  MyApp({required this.calcularIMC});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Calculadora de IMC',
      theme: ThemeData.from(colorScheme: lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: darkColorScheme),
      home: HomePage(calcularIMC: calcularIMC),
    );
  }
}
