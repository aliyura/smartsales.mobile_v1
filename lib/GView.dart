import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartsales_v1/product.dart';

import 'hometables.dart';

class Gview extends StatefulWidget {
  @override
  _GviewState createState() => _GviewState();
}

class _GviewState extends State<Gview> {
  @override
  Widget build(BuildContext context) {
    List<Products> prod = new List();

    @override
    void initState() {
      prod.add(new Products(
          id: "1",
          name: "Lord Vader",
          photo: "pasads",
          price: "1000",
          quantity: "200"));
      prod.add(new Products(
          id: "2",
          name: "Lord Vader",
          photo: "pasads",
          price: "1000",
          quantity: "200"));
      prod.add(new Products(
          id: "3",
          name: "Lord Vader",
          photo: "pasads",
          price: "1000",
          quantity: "200"));
      super.initState();
    }

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: true,
            // appBar: AppBar(
            //   title: Text("Smart Sales"),
            // ),
            body: Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: HomeTable()),
                ],
              )),
            )));
  }
}
