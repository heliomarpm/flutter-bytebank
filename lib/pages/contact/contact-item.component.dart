import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact _contato;
  final Function onClick;

  // ignore: use_key_in_widget_constructors
  const ContactItem(this._contato, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        leading: const Icon(Icons.person),
        title: Text(
          _contato.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          _contato.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
