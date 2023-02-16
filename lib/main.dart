import 'package:flutter/material.dart';
import 'package:gcontacts/show_contacts/dispaly_contacts.dart';

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
      home: DisplayContacts(),
    );
  }
}