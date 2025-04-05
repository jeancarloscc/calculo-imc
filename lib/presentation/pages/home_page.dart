import 'package:flutter/material.dart';
import 'package:imc_calculo/core/usecases/calcular_imc.dart';

import '../../controller/IMCController.dart';
import '../widgets/IMCForm.dart';

class HomePageTeste extends StatelessWidget {
  final IMCController controller;

  const HomePageTeste({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IMCForm(controller: controller),
      ),
    );
  }
}