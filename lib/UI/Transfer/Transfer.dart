import 'package:flutter/material.dart';
import 'package:pharma/Widgets/Container.dart';

class Transfer extends StatefulWidget {
  Transfer({Key key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: container(color: Colors.red),
    );
  }
}
