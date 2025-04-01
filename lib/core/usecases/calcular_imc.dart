class CalcularIMC {
  double executar(double peso, double altura) {
    if (altura <= 0) throw ArgumentError("Altura deve ser maior que zero.");
    return peso / (altura * altura);
  }
}
