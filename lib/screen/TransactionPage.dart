import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorplanner/transactionpage/BillPage.dart';
import 'package:tutorplanner/transactionpage/Cardtotal.dart';
import 'package:tutorplanner/transactionpage/Incometransaction.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: transactionPage(),
    );
  }
}

class transactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<transactionPage> {
  String filterType = "bill";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text(
                  "Transaction",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("bill");
                          },
                          child: Text(
                            "Bill",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "bill")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("income");
                          },
                          child: Text(
                            "Income",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "income")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
              ),
              (filterType == "bill")
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoSearchTextField(),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: DataTable(columns: [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Pay")),
                            DataColumn(label: Text("Total")),
                            DataColumn(label: Text("Status"))
                          ], rows: [
                            DataRow(cells: [
                              DataCell(Text("Test")),
                              
                              DataCell(
                                  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.grey[500]),
                                      child: Text("Bill")), onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => billPage()));
                              }),
                              DataCell(Text("200")),
                              DataCell(ElevatedButton(
                              style:ElevatedButton.styleFrom(
                              primary: Colors.red,
                              minimumSize: Size(double.infinity,30)
                              ) ,
                              child: Text('ยืนยัน'),
                              onPressed: (){

                              }

                              ,)
                              ),
                            ]),
                          ]),
                        ),
                      ],
                    )
                  : Container(),
              (filterType == "income")
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          totalCard(
                            balance: ' 1000',
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyTransaction(
                                      transactionName: 'Teaching ',
                                      money: '500')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }
}
