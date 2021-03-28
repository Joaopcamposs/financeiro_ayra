import 'package:financeiro_ayra/ui/sale_page.dart';
import 'package:flutter/material.dart';
import 'package:financeiro_ayra/helpers/sale_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color colorAyra = const Color(0xFFC69C6D);

  SaleHelper helper = SaleHelper();

  List<Sale> sales = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Financeiro Ayra"),
          backgroundColor: colorAyra,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSalePage();
          },
          child: Icon(Icons.add),
          backgroundColor: colorAyra,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 180,
                  height: 121,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage("images/logoAyra.png"))),
                ),
                TextField(
                  enabled: false,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Vendas no mês: ",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Total de gastos: ",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Lucro: ",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Ticket Médio: ",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ));
  }

  void _showSalePage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => SalePage()));
  }
}
