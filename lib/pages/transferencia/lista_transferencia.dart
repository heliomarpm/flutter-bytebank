import 'package:flutter/material.dart';
import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';

import 'cadastra_transferencia.dart';

const _titlePage = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencia({Key? key}) : super(key: key);

  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titlePage),
      ),
      // body: ListView(
      //   children: const [
      //     ItemTransferencia(Transferencia(100, 1000)),
      //     ItemTransferencia(Transferencia(200, 1000)),
      //     ItemTransferencia(Transferencia(300, 1000)),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) =>
            ItemTransferencia(widget._transferencias[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push<Transferencia>(
            context,
            MaterialPageRoute(
              builder: (context) => const CadastraTransferencia(),
            ),
          ).then((response) => _atualizar(response));
        },
      ),
    );
  }

  void _atualizar(Transferencia? value) {
    if (value != null) {
      setState(() {
        widget._transferencias.add(value);
      });
    }
  }
}
