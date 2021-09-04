import 'package:flutter/material.dart';
import 'package:tutorplanner/NavBar.dart';
import 'package:tutorplanner/screen/Onfirstpage.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: register(),
    );
  }
}

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => openOnfirstpage(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Join tutorplan",
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Register to tutorplan",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "First name"),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Last name"),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "e-mail"),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "password "),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: openHomePage ,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xfff96060)),
                  child: Text(
                    "Sing up",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  openOnfirstpage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => onfirstpage()));
  }
   openHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => nav()));
  }
}
