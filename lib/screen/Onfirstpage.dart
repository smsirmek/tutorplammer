import 'package:flutter/material.dart';
import '../authentication/Login.dart';
import '../authentication/Register.dart';

class Onfirstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: onfirstpage(),
    );
  }
}

// ignore: camel_case_types
class onfirstpage extends StatefulWidget {
  @override
  _onfirstpageState createState() => _onfirstpageState();
}

// ignore: camel_case_types
class _onfirstpageState extends State<onfirstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 250),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('asset/image/Logodaftb.png'),
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/image/path1.png'),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: openLogin,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Colors.white),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: openRegister,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Colors.white),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  openLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  openRegister() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Register()));
  }
}
