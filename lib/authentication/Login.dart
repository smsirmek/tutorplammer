import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:tutorplanner/model/profile.dart';
import 'package:tutorplanner/screen/Onfirstpage.dart';
import 'package:tutorplanner/services/auth_service.dart';
import 'package:tutorplanner/services/google_auth.dart';
import '../wrapper.dart';

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

// ignore: camel_case_types
class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
    email: '',
    password: '',
  );
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
   final authService = FirebaseAuth.instance;

  Future<User?> signInWithGoogle()async{
    await googleAuth().signInWithGoogle().then((value) =>
    Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wrapper()))
    );
  }

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
                        onTap: loginAccount,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 150, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: Color(0xfff96060)),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            minimumSize: Size(double.infinity, 60)),
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        label: Text('Sign in with Google'),
                        onPressed: signInWithGoogle
                        // onPressed: () {
                        //   final provider = Provider.of<GoogleSignInProvider>(
                        //       context,
                        //       listen: false);
                        //   provider.googleLogin().then((value) =>
                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => Wrapper())));
                        // },
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

  loginAccount() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await authService
            .signInWithEmailAndPassword(
                email: profile.email, password: profile.password)
            .then((value) {
          formKey.currentState!.reset();

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wrapper()));
        });
      } on FirebaseAuthException catch (e) {
        // print(e.message);
        Fluttertoast.showToast(msg: e.code, gravity: ToastGravity.CENTER);
      }
    }
  }
}
