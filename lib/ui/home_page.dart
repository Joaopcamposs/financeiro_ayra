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
  int _qtdTotal;
  num _valorTotal;
  num _custoTotal;
  num _lucro;
  num _ticketMedio;

  @override
  void initState() {
    super.initState();

    _getAllSales();
    if (sales.isNotEmpty && sales != null) _getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Financeiro Ayra"),
          backgroundColor: colorAyra,
          centerTitle: true,
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            GestureDetector(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Todas as vendas",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(Icons.assessment_outlined),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Relatórios",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSalePage();
            setState(() {
              _getAllSales();
              if (sales.isNotEmpty && sales != null) _getValues();
            });
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
                      "Quantidade vendido: $_qtdTotal",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Valor total: $_valorTotal",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Custo total: $_custoTotal",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Lucro: $_lucro",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Ticket Médio: $_ticketMedio",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ));
  }

  void _getAllSales() {
    helper.getAllSales().then((list) {
      setState(() {
        sales = list;
      });
    });
  }

  void _getValues() {
    _qtdTotal = sales.length; //quantidade
    for (Sale sale in sales) _valorTotal += num.parse(sale.valor); //valor total
    for (Sale sale in sales) _custoTotal += num.parse(sale.custo); //custo total
    _lucro = (_valorTotal - _custoTotal);
    _ticketMedio = (_valorTotal / _qtdTotal);
  }

  void _showSalePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SalePage()));
  }
}
