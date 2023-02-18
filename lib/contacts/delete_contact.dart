import 'package:flutter/material.dart';
import 'package:gcontacts/database/crud.dart';

class DeleteContact extends StatefulWidget {
  const DeleteContact({super.key});

  @override
  State<DeleteContact> createState() => _DeleteContactState();
}

class _DeleteContactState extends State<DeleteContact> {
  var _curd = CRUD();
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}