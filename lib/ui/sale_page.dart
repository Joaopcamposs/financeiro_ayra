import 'package:flutter/material.dart';
import 'package:financeiro_ayra/helpers/sale_helper.dart';
import 'package:intl/intl.dart';

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

  SaleHelper helper = SaleHelper();
  Sale _newSale;

  Color colorAyra = const Color(0xFFC69C6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Cadastrar Venda"),
            backgroundColor: colorAyra,
            centerTitle: true),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: 144,
                height: 96,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage("images/logoAyra.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _custoController,
                  decoration: InputDecoration(labelText: "Valor de custo"),
                  keyboardType: TextInputType.number,
                  onChanged: (text){
                    setState(() {
                      _newSale.custo = text;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _valorController,
                  decoration: InputDecoration(labelText: "Valor de venda"),
                  keyboardType: TextInputType.number,
                  onChanged: (text){
                    setState(() {
                      _newSale.valor = text;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _tamanhoController,
                  decoration: InputDecoration(labelText: "Tamanho"),
                  onChanged: (text){
                    setState(() {
                      _newSale.tamanho = text;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _corController,
                  decoration: InputDecoration(labelText: "Cor"),
                  onChanged: (text){
                    setState(() {
                      _newSale.color = text;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _refenciaController,
                  decoration: InputDecoration(labelText: "Referência"),
                  onChanged: (text){
                    setState(() {
                      _newSale.ref = text;
                    });
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorAyra)),
                      child: Text(
                        "Cadastrar venda",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onPressed: () {
                        _newSale.data = DateFormat("dd/MM/yyyy").format(DateTime.now());
                        helper.saveSale(_newSale);
                        Navigator.pop(context, AlertDialog(content: Text("Venda salva com suceso"),));
                      },
                    ),
                  )),
            ],
          ),
        ));
  }
}
