import 'package:flutter/material.dart';

import '../contacts/add_contact.dart';
import '../database/crud.dart';

class DisplayContacts extends StatefulWidget {
  const DisplayContacts({super.key});

  @override
  State<DisplayContacts> createState() => _DisplayContactsState();
}

class _DisplayContactsState extends State<DisplayContacts> {
  List<Map<String, dynamic>> list1 = [];
  void _fetchData() async {
    final _crud = CRUD();
    var data = await _crud.getContacts('contacts');
    setState(() {
      list1 = data;
    });
    print(list1);
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    _fetchData();
    super.setState(fn);
  }

  @override
  void initState() {
    _fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          'My Contacts',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Text('$list1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NewContacts()));
          setState(() {
            _fetchData();
          });
        },
        child: Icon(Icons.person_add_alt),
        backgroundColor: Colors.blueGrey,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: 2.0)),
      ),
    );
  }
}
