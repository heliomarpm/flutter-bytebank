import 'package:bytebank/pages/named/named.page.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/tile_button.dart';

import 'package:bytebank/pages/contact/contact-list.page.dart';
import 'transaction/transaction-list.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/app_logo.png'),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(6),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TileButton(
                    'Contatos',
                    Icons.people,
                    onClick: () => _showPage(context, const ContactListPage()),
                  ),
                  TileButton(
                    'Transações',
                    Icons.monetization_on,
                    onClick: () => _showPage(context, TransactionsListPage()),
                  ),
                  TileButton(
                    'Change Name',
                    Icons.person,
                    onClick: () => _showPage(context, const NamedPage()),
                  ),
                ],
              ),
            ),
          ],

          //// GestureDetector não tem os efeitos visuais
          // child: GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const ListaPage(),
          //       ),
          //     );
          //   },
          //   child: const TileCard('Contatos', Icons.people),
          // ),
        ),
      ),
    );
  }

  void _showPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

}
