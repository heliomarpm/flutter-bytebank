class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: R\$ $valor, numeroConta: $numeroConta}';
  }

  Transferencia.fromJson(Map<String, dynamic> json)
      : valor = json['valor'],
        numeroConta = json['numeroConta'];

  Map<String, dynamic> toMap() => {
    'valor': valor,
    'numeroConta': numeroConta,
  };
}
