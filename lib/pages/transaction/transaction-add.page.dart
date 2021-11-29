import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:bytebank/components/busy_indicator.dart';
import 'package:bytebank/components/dialogs.dart';
import 'package:bytebank/http/http_exception.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';

class TransactionAddPage extends StatefulWidget {
  final Contact contact;

  const TransactionAddPage(this.contact, {Key? key}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionAddPage> {
  final TextEditingController _valueController = TextEditingController();
  final String transactionId = const Uuid().v4();
  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: const Padding(
                    padding: EdgeInsets.all(8.0), child: BusyIndicator()),
                visible: _sending,
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      final value = double.tryParse(_valueController.text);
                      final transactionCreated = Transaction(
                        transactionId,
                        value!,
                        widget.contact,
                      );
                      showDialog(
                          context: context,
                          builder: (contextDialog) {
                            return TransactionAuthDialog(
                              onConfirm: (String password) {
                                _save(transactionCreated, password, context);
                              },
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(
    Transaction transactionCreated,
    String password,
    BuildContext context,
  ) async {
    Transaction transaction = await _send(
      transactionCreated,
      password,
      context,
    );
    _showSuccessfulMessage(transaction, context);
  }

  Future _showSuccessfulMessage(
      Transaction transaction, BuildContext context) async {
    // if (transaction != null) {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return const SuccessDialog('successful transaction');
        });
    Navigator.pop(context);
    // }
  }

  Future<Transaction> _send(
    Transaction transactionCreated,
    String password,
    BuildContext context,
  ) async {
    setState(() {
      _sending = true;
    });

    final transaction = await saveTransaction(
      transactionCreated,
      password,
    ).catchError((e) {
      sendCrashLytics(e, transactionCreated.toString());
      _showFailureMessage(context, message: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      sendCrashLytics(e, transactionCreated.toString());
      _showFailureMessage(
        context,
        message: 'timeout submitting the transaction',
      );
    }, test: (e) => e is TimeoutException).catchError((e) {
      sendCrashLytics(e, transactionCreated.toString());
      _showFailureMessage(context);
    }).whenComplete(() {
      setState(() {
        _sending = false;
      });
    });
    return transaction;
  }

  void _showFailureMessage(
    BuildContext context, {
    String message = 'Unknown error',
  }) {
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });

    // final snackBar = SnackBar(content: Text(message));
    // _scaffoldKey.currentState.showSnackBar(snackBar);

    // showToast(message, gravity: Toast.BOTTOM);

    // showDialog(
    //   context: context,
    //   builder: (_) => NetworkGiffyDialog(
    //     image: Image.asset('images/error.gif'),
    //     title: const Text('OPS',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
    //     description: Text(
    //       message,
    //       textAlign: TextAlign.center,
    //     ),
    //     entryAnimation: EntryAnimation.BOTTOM,
    //     onOkButtonPressed: () {},
    //   ),
    // );
  }

  // void showToast(String msg, {int duration = 5, int gravity = Toast.BOTTOM}) {
  //   Toast.show(msg, context, duration: duration, gravity: gravity);
  // }

}
