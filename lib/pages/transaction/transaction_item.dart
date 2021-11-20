import 'package:flutter/material.dart';
import 'package:bytebank/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function onClick;

  // ignore: use_key_in_widget_constructors
  const TransactionItem(this.transaction, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        leading: const Icon(Icons.monetization_on),
        title: Text(
          transaction.value.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          transaction.contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
