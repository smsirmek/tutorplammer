import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: mapPage(),
    );
  }
}
class mapPage extends StatefulWidget {

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<mapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xfff96060),
                elevation: 0,
        title: Text('Map', style: TextStyle(fontSize: 30),)),
      body: Center(
        child: Text('Map screen', style: TextStyle(fontSize: 30),),
      ),
      
    );
  }
}