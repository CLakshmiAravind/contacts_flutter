import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gcontacts/database/crud.dart';
import 'package:gcontacts/database/contact_model.dart';

class NewContacts extends StatefulWidget {
  NewContacts({super.key, required this.contact});
  Map<String, dynamic> contact;
  @override
  State<NewContacts> createState() => _NewContactsState();
}

class _NewContactsState extends State<NewContacts> {
  var _name = TextEditingController();
  var _phone = TextEditingController();
  var _company_name = TextEditingController();
  bool nameCheck = false;
  bool phoneCheck = false;
  bool comapanyCheck = false;
  var _curd = CRUD();
  @override
  void initState() {
    // TODO: implement initState
    if (widget.contact['id'] != null) {
      _name.text = widget.contact['name'];
      _phone.text = widget.contact['phone'].toString();
      _company_name.text = widget.contact['company'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: widget.contact['id']==null?Text(
            'New Contact',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
          :Text(
            'Edit Contact',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView(
            children: [
              // Text('$list1'),
              Icon(
                Icons.person,
                size: 55,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: "enter name",
                    errorText: nameCheck ? 'name cannot be empty' : null,
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "enter phone number",
                    labelText: "phone",
                    errorText:
                        phoneCheck ? 'phone number cannot be empty' : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _company_name,
                decoration: InputDecoration(
                    hintText: "enter company name",
                    labelText: "Company",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Discard',
                        style:
                            TextStyle(color: Colors.red.shade200, fontSize: 25),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 100, 133, 194))),
                  widget.contact['id'] != null
                      ? TextButton(
                        style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 100, 133, 194)),
                          onPressed: () async {
                            setState(() {
                              _phone.text.trim().isEmpty
                                  ? phoneCheck = true
                                  : phoneCheck = false;
                              _name.text.trim().isEmpty
                                  ? nameCheck = true
                                  : nameCheck = false;
                            });
                            await _curd.updateContact('contacts', {
                              'id': widget.contact['id'],
                              'name': _name.text,
                              'phone': _phone.text,
                              'company': _company_name.text
                            });
                            Fluttertoast.showToast(msg: 'contact is updated');
                            Navigator.of(context).pop();
                          },
                          child: Text('update',style: TextStyle(
                                color: Colors.green.shade200, fontSize: 25)),
                        )
                      : TextButton(
                          onPressed: () async {
                            setState(() {
                              _phone.text.trim().isEmpty
                                  ? phoneCheck = true
                                  : phoneCheck = false;
                              _name.text.trim().isEmpty
                                  ? nameCheck = true
                                  : nameCheck = false;
                            });
                            if (phoneCheck == false && nameCheck == false) {
                              await _curd.insertContact('contacts', {
                                'name': _name.text,
                                'phone': _phone.text,
                                'company': _company_name.text
                              });
                              Fluttertoast.showToast(msg: 'contact is saved');
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.green.shade200, fontSize: 25),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 100, 133, 194))),
                ],
              )
            ],
          ),
        ));
  }
}