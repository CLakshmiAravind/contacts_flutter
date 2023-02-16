import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBConnection {
  Future<Database> db()async{
    var dir = await getApplicationDocumentsDirectory();
    var location = join(dir.path,'aravind.db');
    final database = await openDatabase(location,version: 1,onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database database,int version)async{
    String sql = "CREATE TABLE contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone INTEGER, company TEXT)";
    await database.execute(sql);
  }
}