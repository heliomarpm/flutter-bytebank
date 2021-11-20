import 'package:bytebank/components/busy_indicator.dart';
import 'package:bytebank/http/webclient.dart';
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
      body: FutureBuilder<List<Transaction>>(
        future: getAllTransactions(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const BusyIndicator();

            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data;

                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                );
              } else {
                //return Center(child: CircularProgressIndicator());
                return const Center(child: Text('Nenhuma transação cadastrada'));
              }

            default:
              return const Center(
                  child: Text('Algo de errado não está certo 😁'));
          }
        },
      ),
    );
  }
}
