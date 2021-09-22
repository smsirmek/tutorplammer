import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  ? SingleChildScrollView(
                      child: Center(
                          child: ListView(
                            
                            children: [
                            SizedBox(height: 20,),
                            // CupertinoSearchTextField(
                              
                            // ),
                            DataTable(
                             columns: [
                               DataColumn(
                                 label: Text("date")),
                               DataColumn(
                                 label: Text("Name")),
                               DataColumn(
                                 label: Text("Pay")),
                               DataColumn(
                                 label: Text("Status"))
                             ],
                             rows: [
                               DataRow(
                                 cells: [
                                   DataCell(
                                     Text("Test")
                                   ),
                                   DataCell(
                                     Text("Test")
                                   ),
                                   DataCell(
                                     Text("Test")
                                   ),
                                   DataCell(
                                     Text("Test")
                                   ),
                                 ]),
                                
                             ]),

                          ],),
                        
                      ),

                  )
                  : Container(),

              (filterType == "income")
                  ? SingleChildScrollView(
                  
                    child: Container(
                      child: Column(
                        
                        children: [
                          SizedBox(height: 10,),
                          DataTable(
                           columns: [
                             DataColumn(
                               label: Text("date"))
                           ],
                           rows: [
                             DataRow(
                               cells: [
                                 DataCell(
                                   Text("Test")
                                 )
                               ])
                           ]),
                        ],
                      ),
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