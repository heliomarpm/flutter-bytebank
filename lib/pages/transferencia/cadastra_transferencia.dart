import 'package:flutter/material.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/components/pnumber_field.dart';

const _titlePage = 'Criando Transferência';

class CadastraTransferencia extends StatefulWidget {
  const CadastraTransferencia({Key? key}) : super(key: key);

  @override
  _CadastraTransferenciaState createState() => _CadastraTransferenciaState();
}

class _CadastraTransferenciaState extends State<CadastraTransferencia> {
  final _campoNumeroContaController = TextEditingController();
  final _campoValorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titlePage),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PNumberField(_campoNumeroContaController, 'Número da Conta',
                hintText: '0000'),
            PNumberField(_campoValorController, 'Valor',
                hintText: '0.00', icon: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Confirma'),
                  onPressed: () => criarTransferencia(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_campoNumeroContaController.text);
    final valor = double.tryParse(_campoValorController.text);

    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferencia'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, transferencia);
    }
  }
}
