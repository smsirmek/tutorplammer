import 'package:flutter/material.dart';
import 'package:tutorplanner/NavBar.dart';
import 'package:tutorplanner/screen/Onfirstpage.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Sign in to tutorplan",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "e-mail"),
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "password "),
              style: TextStyle(fontSize: 20),
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: openHomePage,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xfff96060)),
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
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
