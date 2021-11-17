import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bytebank/models/contact.dart';

Future<Database> getDatabase() async {
  debugPrint('getDatabase');

  final String dbPath = join(await getDatabasesPath(), 'bytebank.db');

  debugPrint('dbPath: $dbPath');
  return openDatabase(
    dbPath,
    onCreate: (db, version) {
      db
          .execute("CREATE TABLE contato("
              " id INTEGER PRIMARY KEY, "
              " nome TEXT, "
              " num_conta INTEGER"
              ")")
          .then((_) => debugPrint('Tabela criada com sucesso'))
          .catchError((error) => debugPrint('Erro ao criar tabela: $error'));
    },
    onOpen: (db) => debugPrint('Database aberto'),
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> saveContact(Contact value) async {
  final db = await getDatabase();
  final Map<String, dynamic> contatoMap = {};

  contatoMap['nome'] = value.name;
  contatoMap['num_conta'] = value.accountNumber;

  return db.insert('contato', contatoMap);
}

Future<List<Contact>> getAllContact() async {
  final db = await getDatabase();
  final List<Map<String, dynamic>> contatos = await db.query('contato');

  final List<Contact> result = [];

  for (Map<String, dynamic> item in contatos) {
    final contato = Contact(item['id'], item['nome'], item['num_conta']);

    result.add(contato);
  }
  return result;
}
