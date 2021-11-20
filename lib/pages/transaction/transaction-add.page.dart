import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/components/pnumber_field.dart';
import 'package:bytebank/components/ptext_field.dart';
import 'package:bytebank/database/app_db.dart';

class TransactionAddPage extends StatefulWidget {
  final Contact _contact;

  const TransactionAddPage(this._contact, {Key? key}) : super(key: key);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAddPage> {
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Transaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                widget._contact.name,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                widget._contact.accountNumber.toString(),
                style: const TextStyle(
                  fontSize: 32.0,
                ),
              ),
            ),
            PNumberField(_valueController, "Valor"),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Confirma'),
                  onPressed: () => _cadastrar(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _cadastrar(BuildContext context) {
    final _value = double.tryParse(_valueController.text);

    if (_value != null) {
      final _transaction = Transaction(
        _value,
        widget._contact,
      );
      
      saveTransaction(_transaction).then((value) => Navigator.pop(context));
    }
  }
}
