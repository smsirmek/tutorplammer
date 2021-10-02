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
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => transactionPage()));
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: DataTable(columns: [
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("total")),
                  
      
                ], rows: [
                  DataRow(
                    selected: true,
                    onSelectChanged: (b){

                    },
                    cells: [
                    DataCell(Text("08/23/2021")),
                    DataCell(Text("Test")),
                    DataCell(Text("100")),
                    
                  ]),
                ]),
              ),
            ],
          ),
          Container(
            child: Center(
              child: ListView(children: [

              ],)
            ),
          ),
        ],
      ),
    );
  }
}
