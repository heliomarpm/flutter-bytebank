import 'dart:convert';

import 'package:bytebank/http/nterceptors/loggin.interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/models/transaction.dart';


const baseUrl = 'http://localhost:8080/transaction';

final client = InterceptedClient.build(
  interceptors: [
    LogginInterceptor(),
  ],
);

Future<List<Transaction>> getAll() async {
  final Response response = await client
      .get(
        Uri.parse(baseUrl),
      )
      .timeout(const Duration(seconds: 5));

  final List<dynamic> json = jsonDecode(response.body);
  // final List<Transaction> transactions = [];

  // for (Map<String, dynamic> item in json) {
  //   transactions.add(Transaction.fromMap(item));
  // }

  // return transactions;

  return json
      .map((item) => Transaction.fromMap(item))
      .toList();
}

Future<Transaction> saveTransaction(Transaction transaction) async {
  
  final Response response = await client
      .post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: transaction.toJson(),
      )
      .timeout(const Duration(seconds: 5));

  return Transaction.fromMap(jsonDecode(response.body));
}
