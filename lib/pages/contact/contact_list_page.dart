import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/components/contact_item.dart';
import 'package:bytebank/database/app_db.dart';

import 'contact_add_page.dart';

const _titlePage = 'Contatos';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titlePage),
      ),
      // body: ListView(
      //   children: const [
      //     ItemTransferencia(Transferencia(100, 1000)),
      //     ItemTransferencia(Transferencia(200, 1000)),
      //     ItemTransferencia(Transferencia(300, 1000)),
      //   ],
      // ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        //para testar e mostrar a tela vermelha
        // future: Future.delayed(const Duration(seconds: 1)).then((value) => getAllContact()),
        future: getAllContact(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Contact> contatos = snapshot.data;

                return ListView.builder(
                  itemCount: contatos.length,
                  itemBuilder: (context, index) => ContactItem(contatos[index]),
                );
              } else {
                //return Center(child: CircularProgressIndicator());
                return const Center(child: Text('Nenhum contato cadastrado'));
              }

            default:
              return const Center(child: Text('Nenhum contato cadastrado'));
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push<Contact>(
                MaterialPageRoute(
                  builder: (context) => const ContactAddPage(),
                ),
              )
              .then(
                (response) => setState(() {}),
              );
        },
      ),
    );
  }
}
