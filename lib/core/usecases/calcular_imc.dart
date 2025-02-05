// lib/core/usecases/calcular_imc.dart

import 'package:imc_calculo/data/repositories/imc_repository.dart';

class CalcularIMC {
  final IMCRepository imcRepository;

  CalcularIMC(this.imcRepository);

  double executar(double peso, double altura) {
    return imcRepository.calcularIMC(peso, altura);
  }
}
