import 'package:flutter/material.dart';
import 'package:tutorplanner/screen/TransactionPage.dart';

class billPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff96060),
          elevation: 0,
          title: Text(
            "Bill payment",
            style: TextStyle(fontSize: 30),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => transactionPage()));
            },
          ),
        ));
  }
}
