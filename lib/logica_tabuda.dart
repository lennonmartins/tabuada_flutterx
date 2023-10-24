class CalculadoraTabuada {
  List<String> calcularTabuada(int numero) {
    List<String> resultados = [];
    for (int i = 1; i <= 10; i++) {
      resultados.add('$numero x $i = ${numero * i}');
    }
    return resultados;
  }
}
