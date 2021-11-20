import 'package:flutter/material.dart';
import 'demo_page.dart';
import 'pages/home_page.dart';

//https://material.io/resources/color/

void main() => runApp(const BytebankApp());

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
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green[900],
        // primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
        //       bodyColor: Colors.black,
        //       displayColor: Colors.black,
        //     ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent[700],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
