import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: listPage(),
    );
  }
}

class listPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff96060),
          elevation: 0,
          title: Text(
            'Student List',
            style: TextStyle(fontSize: 30),
          )),
      body: Center(
        child: Text(
          'List screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
