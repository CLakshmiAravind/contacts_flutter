import 'package:gcontacts/database/crud.dart';
import 'package:gcontacts/model/contact_model.dart';

class Middleware{
  late CRUD _curd;
  Middleware(){
    _curd = CRUD();
  }
  saveContact(ContactModel con)async{
    await _curd.insertContact('contacts', con.toMap());
  }
}