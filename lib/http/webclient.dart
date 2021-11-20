import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/models/contact.dart';

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    developer.log('Request');
    developer.log('url: ${data.url}');
    developer.log('headers: ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    developer.log('Response');
    developer.log('status code: ${data.statusCode}');
    developer.log('headers: ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }
}

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
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> item in json) {
    transactions.add(Transaction.fromMap(item));
  }

  return transactions;
}

Future<Transaction> saveTransaction(Transaction transaction) async {
  final response = await client
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
