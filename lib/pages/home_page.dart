import 'package:flutter/material.dart';
import 'package:bytebank/pages/contact/contact_list_page.dart';
import 'package:bytebank/components/tile_item.dart';

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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContactListPage(),
                      ),
                    );
                  },
                  child: const TileItem('Contatos', Icons.people),
                ),
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
