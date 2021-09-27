import 'package:flutter/material.dart';
import 'package:tutorplanner/ListPage/DataAddPage.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: listPage(),
    );
  }
}

// ignore: camel_case_types
class listPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<listPage> {
  List listitems = [];
  var _currmax = 14;
  var _noofdoc = 30;

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listitems = List.generate(14, (i) => "Item $i");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (listitems.length < _noofdoc) loadmoreitem();
        print(listitems);
      }
    });
  }

  loadmoreitem() {
    for (int i = _currmax; i < _currmax + 14; i++) {
      listitems.add("Item $i");
    }
    _currmax = _currmax + 14;
    if (_currmax > _noofdoc) {
      int length = _currmax - _noofdoc;
      _currmax = _currmax - length;
      listitems.length = _currmax;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff96060),
          elevation: 0,
          title: Text(
            'Student List',
            style: TextStyle(fontSize: 30),
          )),
      body: Center(
          child: ListView.builder(
        controller: _scrollController,
        itemExtent: 50,
        itemCount: listitems.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == listitems.length - 1 && listitems.length != _noofdoc) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
              ),
            );
          }
          return ListTile(
            title: Text(listitems[index]),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => dataappPage()));
        },
      ),
    );
  }
}
