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
      body: Padding(
       padding: EdgeInsets.fromLTRB(30.0, 40.0, 35.5, 0.0) ,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
             backgroundImage: AssetImage('asset/image/Logodaftb.png'),
              radius: 50.0,
            ),
          ),
          Divider(
            height: 50.0,
            color: Colors.black,
          ),
          Text(
            'Firstname',
            style: TextStyle(
            color: Colors.black,
            letterSpacing: 2.0,
          ) ,),
          SizedBox(height: 9.5),
          Text(
            'peter',
              style: TextStyle(
              color: Colors.red,
              letterSpacing: 2.0,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ) ,),
          SizedBox(height: 25.5),
          Text(
            'Lastname',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
            ) ,),
          SizedBox(height: 9.5),
          Text(
            ' parker ',
            style: TextStyle(
                color: Colors.red,
                letterSpacing: 2.0,
                fontSize: 30.0,
                fontWeight: FontWeight.bold
            ) ,),
          SizedBox(height: 25.5),
          Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.blueAccent,
              ),
              SizedBox(width: 7.0),
              Text(
                  'Paker@gmail.com',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
              ),
              SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: null,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xfff96060)),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
            ],
          )
        ],
       ),
      ),
    );
  }
}