import 'package:flutter/material.dart';

class PTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final String? hintText;
  final IconData? icon;

  // ignore: use_key_in_widget_constructors
  const PTextField(this._controller, this._labelText,
      {this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: _labelText,
            hintText: hintText ?? '',
            icon: icon != null ? Icon(icon) : null,
          ),
          style: const TextStyle(fontSize: 24.0)
        ));
  }
}