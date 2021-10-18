import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(
      const Home()
  );
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Documentação',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
