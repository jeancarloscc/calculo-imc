// lib/data/repositories/imc_repository.dart

class IMCRepository {
  double calcularIMC(double peso, double altura) {
    // Cálculo de IMC
    return peso / (altura * altura);
  }
}
