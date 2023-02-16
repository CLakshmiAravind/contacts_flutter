import 'package:flutter/material.dart';
import 'package:gcontacts/database/crud.dart';
import 'package:gcontacts/model/contact_model.dart';

import '../middleware/middleware.dart';

class NewContacts extends StatefulWidget {
  const NewContacts({super.key});

  @override
  State<NewContacts> createState() => _NewContactsState();
}

class _NewContactsState extends State<NewContacts> {
  void _fetchData()async{
    final _crud = CRUD();
    var data=await _crud.getContacts('contacts');
    setState(() {
      list1 = data;
    });
    print(list1);
  }
  List<Map<String,dynamic>> list1=[];
  var _name = TextEditingController();
  var _phone = TextEditingController();
  var _company_name = TextEditingController();
  bool nameCheck = false;
  bool phoneCheck = false;
  bool comapanyCheck = false;
  final _middleware = Middleware();
  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact',style: TextStyle(fontWeight: FontWeight.bold,),),
      ),
      body:Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: ListView(
          children: [
            Text('$list1'),
            Icon(Icons.person,size: 55,),
            SizedBox(height: 20,),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "enter name",
                errorText: nameCheck?'name cannot be null':null,
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "enter phone number",
                labelText: "phone",
                errorText: phoneCheck?'phone number cannot be null':null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _company_name,
              decoration: InputDecoration(
                hintText: "enter company name",
                labelText: "Company",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){}, child: Text('Discard',style: TextStyle(color: Colors.red.shade200,fontSize: 25),),style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 100, 133, 194))),
                TextButton(onPressed: ()async{
                  setState(() {
                    _phone.text.trim().isEmpty?phoneCheck=true:phoneCheck=false;
                    _name.text.trim().isEmpty?nameCheck=true:nameCheck=false;
                    
                  });
                  if (phoneCheck==false && nameCheck==false) {
                    final _contact = ContactModel();
                    _contact.name = _name.text.trim();
                    _contact.company = _company_name.text==''?_company_name.text=' ':_company_name.text.trim();
                    await _middleware.saveContact(_contact);
                    setState(() {
                      _fetchData();
                    });
                  }
                }, child: Text('Save',style: TextStyle(color: Colors.green.shade200,fontSize: 25),),style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 100, 133, 194))),
              ],
            )
          ],
        ),
      )
    );
  }
}