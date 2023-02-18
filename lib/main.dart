import 'package:flutter/material.dart';
import 'package:gcontacts/screens/dispaly_contacts.dart';

void main() {
  runApp(MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,        //it will hide the debug banner which is seen on top right
      home: DisplayContacts(),
    );
  }
}