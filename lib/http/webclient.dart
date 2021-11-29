import 'dart:convert';

import 'package:bytebank/http/http_exception.dart';
import 'package:bytebank/http/nterceptors/loggin.interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/models/transaction.dart';


const baseUrl = 'http://192.168.0.8:3000/transaction';

final client = InterceptedClient.build(
  interceptors: [LogginInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);

Future<List<Transaction>> getAllTransactions() async {
  final Response response = await client.get(
    Uri.parse(baseUrl),
  ); //.timeout(const Duration(seconds: 5));

  final List<dynamic> json = jsonDecode(response.body);
  // final List<Transaction> transactions = [];

  // for (Map<String, dynamic> item in json) {
  //   transactions.add(Transaction.fromMap(item));
  // }

  // return transactions;

  return json.map((item) => Transaction.fromMap(item)).toList();
}

Future<Transaction> saveTransaction(
    Transaction transaction, String token) async {
  //simula um delay para provocar o erro
  await Future.delayed(const Duration(seconds: 2));

  final Response response = await client.post(
    Uri.parse(baseUrl),
    headers: {
      'Content-Type': 'application/json',
      //'Authorization': 'Bearer $token'
    },
    body: transaction.toJson(),
  ); //.timeout(const Duration(seconds: 5));

  if (response.statusCode == 200) {
    return Transaction.fromMap(jsonDecode(response.body));
  }

  throw HttpException(_getMessage(response.statusCode));
}

String _getMessage(int statusCode) {
  String response = 'unknown error';

  if (_statusCodeResponses.containsKey(statusCode)) {
    response = _statusCodeResponses[statusCode] ?? response;
  }
  return response;
}

final Map<int, String> _statusCodeResponses = {
  400: 'there was an error submitting transaction',
  401: 'authentication failed',
  409: 'transaction already exists'
};
