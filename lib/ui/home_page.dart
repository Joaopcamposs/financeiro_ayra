import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color colorAyra = const Color(0xFFC69C6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Financeiro Ayra"),
        backgroundColor: colorAyra,
        centerTitle: true,
      ),
    );
  }
}
