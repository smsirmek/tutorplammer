import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tutorplanner/model/profile.dart';
import 'package:tutorplanner/screen/Onfirstpage.dart';
import '../wrapper.dart';

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
  
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: '',
    password: '',
  );
  
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final authService = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
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
                child: Form(
                  key: formKey,
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
                      // TextField(
                      //   decoration: InputDecoration(hintText: "First name"),
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextField(
                      //   decoration: InputDecoration(hintText: "Last name"),
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "กรุณากรอกอีเมล"),
                          EmailValidator(errorText: "รูปแบบไม่ถูกต้อง")
                        ]),
                        decoration: InputDecoration(hintText: "e-mail"),
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String? email) {
                          profile.email = email!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "กรุณากรอกพาสเวิร์ด"),
                        decoration: InputDecoration(hintText: "password "),
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        onSaved: (String? password) {
                          profile.password = password!;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: registerAccount,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 130, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: Color(0xfff96060)),
                            child: Text(
                              "Sing up",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  openOnfirstpage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => onfirstpage()));
  }

  void registerAccount() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: profile.email, password: profile.password)
            .then((value) {
          formKey.currentState!.reset();
          Fluttertoast.showToast(
              msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว !!",
              gravity: ToastGravity.CENTER);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wrapper()));
        });
      } on FirebaseAuthException catch (e) {
        print(e.code);
        var message;
        if (e.code == 'email-already-in-use') {
          message = "อีเมลนี้ถูกใช้แล้ว";
        } else if (e.code == 'weak-password') {
          message = "รหัสผ่านต้องมีความยาว 6 ตัวขึ้นไป";
        } else {
          
          message = e.message;
        }
        // print(e.message);
        Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
      }
    }
  }
}
