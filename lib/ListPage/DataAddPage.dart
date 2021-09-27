import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tutorplanner/model/student.dart';

class DataAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: dataappPage(),
    );
  }
}

class dataappPage extends StatefulWidget {
  @override
  _DataAppPageState createState() => _DataAppPageState();
}

class _DataAppPageState extends State<dataappPage> {
  final formKey = GlobalKey<FormState>();
  Studentdata myStudent = Studentdata();
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
                        validator:
                            RequiredValidator(errorText: "Invalid information"),
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
                        validator:
                            RequiredValidator(errorText: "Invalid information"),
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
                        validator:
                            RequiredValidator(errorText: "Invalid information"),
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
                        validator:
                            RequiredValidator(errorText: "Invalid information"),
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
                        validator:
                            RequiredValidator(errorText: "Invalid information"),
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
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
