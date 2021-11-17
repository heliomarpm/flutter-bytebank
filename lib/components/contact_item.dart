
import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact _contato;

  // ignore: use_key_in_widget_constructors
  const ContactItem(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(_contato.name),
        subtitle: Text(_contato.accountNumber.toString()),
      ),
    );
  }
}