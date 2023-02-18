import 'package:flutter/material.dart';

class CallingScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  CallingScreen({super.key, required this.Name, required this.phone});
  String Name;
  int phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Icon(
              Icons.person_rounded,
              size: MediaQuery.of(context).size.width*0.3,
              color: Colors.green.shade200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text('${Name}',style: TextStyle(fontSize: 28)),
            Text('${phone.toString()}',style: TextStyle(fontSize: 28),),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.speaker,
                size: 30,
              ),
              CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.call_end, color: Colors.white, size: 30)),
              Icon(Icons.volume_mute, size: 30),
              
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1,)
        ],
      ),
      
    );
  }
}
