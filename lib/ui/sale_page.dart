import 'package:flutter/material.dart';

class SalePage extends StatefulWidget {
  @override
  _SalePageState createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {

  final _custoController = TextEditingController();
  final _valorController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _corController = TextEditingController();
  final _refenciaController = TextEditingController();

  Color colorAyra = const Color(0xFFC69C6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cadastrar Venda"),
            backgroundColor: colorAyra,
            centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: 180,
                height: 121,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage("images/logoAyra.png")
                    )
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 25),
                child: TextField(
                  controller: _custoController,
                  decoration: InputDecoration(labelText: "Valor de custo"),
                  keyboardType: TextInputType.number,
                ),),
              Padding(padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _valorController,
                  decoration: InputDecoration(labelText: "Valor de venda"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _tamanhoController,
                  decoration: InputDecoration(labelText: "Tamanho"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _corController,
                  decoration: InputDecoration(labelText: "Cor"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _refenciaController,
                  decoration: InputDecoration(labelText: "Referência"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
