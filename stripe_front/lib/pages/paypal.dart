import 'package:flutter/material.dart';

class PaypalPage extends StatelessWidget {
  const PaypalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Paypal', style: TextStyle(color: Colors.white, fontSize: 23)),
        centerTitle: true,
      ),
      body: Container(
        child: Text("En desarrollo..."),
      ),
    );
  }
}
