import 'package:bytebank/pages/named/named.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamedPage extends StatelessWidget {
  const NamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => NamedCubit("Heliomar Marques"),
    //   child: _NamedView(),
    // );
    return _NamedView();
  }
}

class _NamedView extends StatelessWidget {
  _NamedView({Key? key}) : super(key: key);

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NamedCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Change Name')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Your Name'),
              style: const TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                child: const Text('Change'),
                onPressed: () {
                  context.read<NamedCubit>().changeName(_nameController.text);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
