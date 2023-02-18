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
  List<Map<String, dynamic>> results = [];
  String? search = '';
  void _fetchData() async {
    final _crud = CRUD();
    var data = await _crud.getContacts('contacts');
    setState(() {
      list1 = data;
    });
    // print(list1);
  }

  void _searchResults(value) {
    results = list1
        .where((user) =>
            user["name"].toLowerCase().startsWith(value.toLowerCase()))
        .toList();
    search = value;
    print(results);
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
        // title: Text(
        //   'My Contacts',
        //   style: TextStyle(fontSize: 25),
        // ),
        title: TextField(
          decoration: InputDecoration(hintText: "Search Contacts",hintStyle: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic)),
          style: TextStyle(color: Colors.white,fontSize: 21),
          onChanged: (value) => _searchResults(value),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 15),
        child: list1.length == 0
            ? Text('No contacts...')
            : results.length == 0 && search.toString().trim().isEmpty
                ? ListView.builder(
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                          contact: list1[index])));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              // height: MediaQuery.of(context).size.height*0.08,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '${list1[index]['name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('${list1[index]['phone']}')
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Dailing(
                                                  Name: list1[index]['name'],
                                                  phone: list1[index]
                                                      ['phone'])));
                                    },
                                    child: Icon(Icons.call),
                                  )
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
                  )
                : results.length == 0 && search.toString().isNotEmpty
                    ? Text('No results found')
                    : ListView.builder(
                        itemBuilder: ((context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProfileScreen(
                                              contact: results[index])));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  // height: MediaQuery.of(context).size.height*0.08,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.blueGrey)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${results[index]['name']}',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('${results[index]['phone']}')
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Dailing(
                                                      Name: results[index]
                                                          ['name'],
                                                      phone: results[index]
                                                          ['phone'])));
                                        },
                                        child: Icon(Icons.call),
                                      )
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
                        itemCount: results.length,
                      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => NewContacts(
                        contact: {},
                      )));
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
