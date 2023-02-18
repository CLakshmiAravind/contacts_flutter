import 'package:flutter/material.dart';

class Dailing extends StatelessWidget {
  Dailing({super.key,required this.Name,required this.phone});
  String Name;
  int phone;

  bool volume=false;

  bool mic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false,elevation: 0,),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Icon(Icons.person,size: MediaQuery.of(context).size.width*0.3,),
            SizedBox(height: 50),
            Text('$Name',style: TextStyle(fontSize: 25),),
            SizedBox(height: 15),
            Text('$phone',style: TextStyle(fontSize: 25),),
            SizedBox(height: MediaQuery.of(context).size.height*0.4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: (){if (volume==false) {
                  volume=true;
                } else {
                  volume=false;
                }},child: volume==false?Icon(Icons.volume_up,size: MediaQuery.of(context).size.width*0.1,):Icon(Icons.volume_down,size: MediaQuery.of(context).size.width*0.1,)),
                InkWell(onTap: (){Navigator.of(context).pop();},child:  CircleAvatar(backgroundColor: Colors.red,child:Icon(Icons.call_end,size: MediaQuery.of(context).size.width*0.1,color: Colors.white,),)),
                InkWell(onTap: (){mic=!mic;},child: mic==false?Icon(Icons.mic_off,size: MediaQuery.of(context).size.width*0.1,):Icon(Icons.mic,size: MediaQuery.of(context).size.width*0.1,)),
              ],
            )
          ],
        )
        ),
    );
  }
}