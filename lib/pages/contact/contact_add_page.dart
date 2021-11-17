import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/components/pnumber_field.dart';
import 'package:bytebank/components/ptext_field.dart';
import 'package:bytebank/database/app_db.dart';

class ContactAddPage extends StatefulWidget {
  const ContactAddPage({Key? key}) : super(key: key);

  @override
  _ContactAddPageState createState() => _ContactAddPageState();
}

class _ContactAddPageState extends State<ContactAddPage> {
  final _nameController = TextEditingController();
  final _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PTextField(_nameController, "Nome"),
            PNumberField(_accountNumberController, "Número Conta"),
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
    final _nome = _nameController.text;
    final _numeroConta = int.tryParse(_accountNumberController.text);

    if (_numeroConta != null && _nome != "") {
      final contato = Contact(0, _nome, _numeroConta);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$contato'),
          backgroundColor: Colors.green,
        ),
      );

      saveContact(contato).then((value) => Navigator.pop(context));
    }
  }
}