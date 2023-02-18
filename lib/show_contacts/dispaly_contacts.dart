import 'package:flutter/material.dart';
import 'package:gcontacts/calling/calling_screen.dart';
import 'package:gcontacts/profile/profile_screen.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 15),
        child: list1.length==0?Text('data is loading...'):ListView.builder(
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen(contact:list1[index])));},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.height*0.08,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blueGrey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${list1[index]['name']}',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text('${list1[index]['phone']}')
                            ],
                          ),
                        
                       InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Dailing(Name:list1[index]['name'],phone:list1[index]['phone'])));},child: Icon(Icons.call),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }),
          itemCount: list1.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NewContacts(contact: {},)));
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
