import 'dart:async';

import 'package:bytebank/pages/counter/counter.page.dart';
import 'package:bytebank/pages/named/named.page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'demo_page.dart';
import 'pages/home_page.dart';

import 'package:flutter/foundation.dart' show kDebugMode;

//https://material.io/resources/color/

void main() async {
  runZonedGuarded<Future<void>>(() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // força o primeiro erro para terminar a configuração do crashlytics
    // FirebaseCrashlytics.instance.crash();

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FirebaseCrashlytics.instance.setUserIdentifier('UsuarioLogado');
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    runApp(const BytebankApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StackDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // home: const CounterPage(),
      // home: const HomePage(),
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   primaryColor: Colors.green[900],
      //   // primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
      //   //       bodyColor: Colors.black,
      //   //       displayColor: Colors.black,
      //   //     ),
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     secondary: Colors.blueAccent[700],
      //   ),
      //   buttonTheme: ButtonThemeData(
      //     buttonColor: Colors.blueAccent[700],
      //     textTheme: ButtonTextTheme.primary,
      //   ),
      // ),
    );
  }
}
