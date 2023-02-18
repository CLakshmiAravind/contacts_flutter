import 'package:flutter/material.dart';
import 'package:gcontacts/contacts/add_contact.dart';
import 'package:gcontacts/contacts/delete_contact.dart';
import 'package:gcontacts/database/crud.dart';
import 'package:gcontacts/show_contacts/dispaly_contacts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key,required this.contact});
  // String? Name;
  // int? phone;
  // String? company;
  // int? id;
  Map<String,dynamic> contact ;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _curd = CRUD();


void delete(){
  _curd.deleteContact('contacts', widget.contact);
}

Future<void> _showAlertDialog() async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog( 
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('are you sure to delete the contact?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              delete();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>DisplayContacts()));
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          InkWell(
            onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>NewContacts(contact: widget.contact)));},
            child: Icon(
              Icons.edit,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: (){_showAlertDialog();},
            child: Icon(Icons.delete, color: Colors.red),),
        ]),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Name :   ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${widget.contact['name']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      'Phone :   ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${widget.contact['phone']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      'Company :',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${widget.contact['company']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       'id :   ',
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     Text(
          //       '$id',
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // )
        ],
      )),
    );
  }
}
