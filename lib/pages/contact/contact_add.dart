import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/components/pnumber_field.dart';
import 'package:bytebank/components/ptext_field.dart';

class ContactAdd extends StatefulWidget {
  const ContactAdd({Key? key}) : super(key: key);

  @override
  _ContactAddState createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {
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
          children: <Widget>[
            PTextField(_nameController, "Nome"),
            PNumberField(_accountNumberController, "Conta"),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final name = _nameController.text;
                    final accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final newContact = Contact(name, accountNumber!);
                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}