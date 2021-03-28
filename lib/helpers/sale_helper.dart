import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String salesTable = "salesTable";
final String idColumn = "idColumn";
final String custoColumn = "custoColumn";
final String valorColumn = "valorColumn";
final String tamanhoColumn = "tamanhoColumn";
final String colorColumn = "colorColumn";
final String refColumn = "refColumn";
final String dataColumn = "dataColumn";

class SaleHelper{
  static final SaleHelper _instance = SaleHelper.internal();

  factory SaleHelper() => _instance;

  SaleHelper.internal();

  Database _db;

  Future<Database> get db async{
    if (_db != null)
      return _db;
    else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "salesNew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $salesTable($idColumn INTEGER PRIMARY KEY, $custoColumn REAL, "
                  "$valorColumn REAL, $tamanhoColumn TEXT, $colorColumn TEXT, $refColumn TEXT, "
                  "$dataColumn TEXT)");
        });
  }

  Future<Sale> saveSale(Sale sale) async {
    Database dbSale = await db;
    sale.id = await dbSale.insert(salesTable, sale.toMap());
    return sale;
  }

  Future<Sale> getSale(int id) async {
    Database dbSale = await db;
    List<Map> maps = await dbSale.query(salesTable,
        columns: [idColumn, custoColumn, valorColumn, tamanhoColumn, colorColumn, refColumn, dataColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0)
      return Sale.fromMap(maps.first);
    else
      return null;
  }

  Future<int> deleteSale(int id) async {
    Database dbSale = await db;
    return await dbSale
        .delete(salesTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateSale(Sale sale) async {
    Database dbSale = await db;
    return await dbSale.update(salesTable, sale.toMap(),
        where: "$idColumn = ?", whereArgs: [sale.id]);
  }

  Future<List> getAllSales() async {
    Database dbSale = await db;
    List listMap = await dbSale.rawQuery("SELECT * FROM $salesTable");
    List<Sale> listSales = List();
    for (Map m in listMap) {
      listSales.add(Sale.fromMap(m));
    }
    return listSales;
  }

  Future close() async {
    Database dbSale = await db;
    dbSale.close();
  }

}

class Sale{
  int id;
  String custo;
  String valor;
  String tamanho;
  String color;
  String ref;
  String data;

  Sale();

  Sale.fromMap(Map map){
    id = map[idColumn];
    custo = map[custoColumn];
    valor = map[valorColumn];
    tamanho = map[tamanhoColumn];
    color = map[colorColumn];
    ref = map[refColumn];
    data = map[dataColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      custoColumn: custo,
      valorColumn: valor,
      tamanhoColumn: tamanho,
      colorColumn: color,
      refColumn: ref,
      dataColumn: data,
    };
    if (id != null) map[idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "Sale(saleId: $id, custo: $custo, valor: $valor, tamanho: $tamanho, cor: $color, ref: $ref, data: $data)";
  }
}