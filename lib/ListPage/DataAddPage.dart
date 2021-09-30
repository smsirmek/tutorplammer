import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tutorplanner/model/student.dart';
import 'package:tutorplanner/screen/ListPage.dart';

class DataAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: dataaddPage(),
    );
  }
}

class dataaddPage extends StatefulWidget {
  @override
  _DataAppPageState createState() => _DataAppPageState();
}

class _DataAppPageState extends State<dataaddPage> {
  final formKey = GlobalKey<FormState>();
  Studentdata myStudent = Studentdata();
  // for set
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference studentdata =
      FirebaseFirestore.instance.collection("studentdata");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xfff96060),
            elevation: 0,
            title: Text(
              'AddDataStudent',
              style: TextStyle(fontSize: 30),
            )),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add data Student",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (sname) {
                          if (sname!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(sname)) {
                            return "Enter correct name";
                          } else {
                            return null;
                          }
                        },
                        // RequiredValidator(errorText: "Invalid information"),
                        decoration: InputDecoration(hintText: "Student name"),
                        style: TextStyle(fontSize: 20),
                        onSaved: (String? sname) {
                          myStudent.sname = sname;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (lname) {
                          if (lname!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(lname)) {
                            return "Enter correct name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Parent's name"),
                        style: TextStyle(fontSize: 20),
                        onSaved: (String? pname) {
                          myStudent.pname = pname;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (scont) {
                          if (scont!.isEmpty ||
                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                  .hasMatch(scont)) {
                            return "Enter correct phone number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration:
                            InputDecoration(hintText: "Student contact"),
                        style: TextStyle(fontSize: 20),
                        onSaved: (String? scont) {
                          myStudent.scont = scont;
                        },
                      ),
                      TextFormField(
                        validator: (pcont) {
                          if (pcont!.isEmpty ||
                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                  .hasMatch(pcont)) {
                            return "Enter correct phone number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration:
                            InputDecoration(hintText: "Parent's contact"),
                        style: TextStyle(fontSize: 20),
                        onSaved: (String? pcont) {
                          myStudent.pcont = pcont;
                        },
                      ),
                      TextFormField(
                        validator: (address) {
                          if (address!.isEmpty) {
                            return "Enter correct name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Address"),
                        style: TextStyle(fontSize: 20),
                        onSaved: (String? address) {
                          myStudent.address = address;
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent),
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              await studentdata.add({
                                "sname": myStudent.sname,
                                "pname": myStudent.pname,
                                "scont": myStudent.scont,
                                "pcont": myStudent.pcont,
                                "address": myStudent.address
                              });
                              formKey.currentState!.reset();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => listPage()));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
