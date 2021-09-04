import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: profilePage(),
    );
  }
}
class profilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xfff96060),
        elevation: 0,
        title: Text('Profile', style: TextStyle(fontSize: 30),)),
      body: Center(
        child: Text('Profile screen', style: TextStyle(fontSize: 30),),
      ),
        
      
    );
  }
}