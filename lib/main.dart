// lib/main.dart

import 'package:flutter/material.dart';
import 'package:imc_calculo/color_schemes.g.dart';
import 'package:imc_calculo/controller/IMCController.dart';
import 'presentation/pages/home_page.dart';
import 'core/usecases/calcular_imc.dart';

void main() {
  final calcularIMC = CalcularIMC();
  final controller = IMCController(calcularIMC);

  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final IMCController controller;

  const MyApp({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Calculadora de IMC',
      theme: ThemeData.from(colorScheme: lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: darkColorScheme),
      home: HomePageTeste(controller: controller,),
    );
  }
}
