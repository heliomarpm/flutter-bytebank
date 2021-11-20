import 'package:flutter/material.dart';

class BusyIndicator extends StatelessWidget {
  final String message;
  const BusyIndicator({Key? key, this.message = 'aguarde...'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(message),
        ]
      ),
    );
  }
}