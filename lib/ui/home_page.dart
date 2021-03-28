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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: 180,
                height: 121,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage("images/logoAyra.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Vendas no mês: ")
              ),
            ],
          ),
        ),
      )
    );
  }
}
