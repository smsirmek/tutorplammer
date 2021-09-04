import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: transactionPage(),
    );
  }
}
class transactionPage extends StatefulWidget {

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<transactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xfff96060),
        elevation: 0,
        title: Text('Transaction', style: TextStyle(fontSize: 30),)),
      body: Center(
        child: Text('Transaction screen', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}