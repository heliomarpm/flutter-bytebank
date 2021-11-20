import 'package:flutter/material.dart';
import 'package:bytebank/models/transaction.dart';

class TransactionsListPage extends StatelessWidget {
  final List<Transaction> transactions = [];

  TransactionsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                transaction.contact.accountNumber.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
