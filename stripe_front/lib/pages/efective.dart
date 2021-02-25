import 'package:flutter/material.dart';

class EfectivePage extends StatelessWidget {
  const EfectivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Efectivo',
            style: TextStyle(color: Colors.white, fontSize: 23)),
        centerTitle: true,
      ),
    );
  }
}
