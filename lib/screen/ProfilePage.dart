import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorplanner/screen/Onfirstpage.dart';
import 'package:tutorplanner/services/auth_service.dart';
import 'package:tutorplanner/services/google_auth.dart';

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
// ignore: camel_case_types
class profilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilePage> {

  final authService = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

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
             backgroundImage: AssetImage('asset/image/profile1.png'),
              radius: 50.0,
            ),
          ),
          Divider(
            height: 50.0,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          
          Center(
            child: Column(
              children: [
                Text('Name: '+user.email.toString(),
                style: TextStyle(fontSize: 18),),

                SizedBox(height: 10,),

                Text('email: '+user.displayName.toString(),
                style: TextStyle(fontSize: 18),),
              ],
            ),
          ),

          SizedBox(height: 40,),
            InkWell(
              onTap: logoutAccount,
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
       ),
      ),
    );
  }

  logoutAccount() async {
   await googleAuth().signOut().then((value){
      
      Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => onfirstpage()));

    });
  }
}