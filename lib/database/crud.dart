import 'package:gcontacts/database/connection.dart';
import 'package:sqflite/sqflite.dart';

class CRUD{
  late DBConnection _connection;
  CRUD(){
    _connection = DBConnection();
  }

  static Database? _database;
  Future<Database> get db async{
    if (_database==null) {
      _database = await _connection.db();
    return _database!;
    } else {
        return _database!;
      
    }
  }

  insertContact(table,details)async {
    final _database = await db;
   await _database.insert(table, details);
  }

  getContacts(table)async{
    final _database = await db;
    return _database.query(table);
  }

  getSingle(table,id)async{
    final _database = await db;
    return _database.query(table,where: 'id=?',whereArgs: [id]);
  }

  updateContact(table,contact)async{
    final _database = await db;
    return _database.update(table, contact,where: 'id=?',whereArgs: [contact['id']]);
  }


  deleteContact(table,contact)async{
    final _database = await db;
    await _database.delete(table,where: 'id=?',whereArgs: [contact['id']]);
  }
}