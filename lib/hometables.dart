// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartsales_v1/product.dart';

class HomeTable extends StatefulWidget {
  @override
  _HomeTableState createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
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

  @override
  Widget build(BuildContext context) {
    return Container(child: table(context));
  }

  Widget table(context) {
    return SingleChildScrollView(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        children: [
          TableRow(children: [
            tableData(context),
          ])
        ],
      ),
    );
  }

  Widget tableData(context) {
    return DataTable(
        sortAscending: true,
        sortColumnIndex: 0,
        showBottomBorder: true,
        columns: [
          DataColumn(
              label: Text("Product Name",
                  style: TextStyle(color: Colors.redAccent))),
          DataColumn(
              label: Text("Product Quantity",
                  style: TextStyle(color: Colors.redAccent))),
          DataColumn(
              label: Text("Product Price",
                  style: TextStyle(color: Colors.redAccent))),
        ],
        rows: prod
            .map((p) => DataRow(cells: [
                  new DataCell(
                    Text(p.id),
                    onTap: () {
                      // Fluttertoast.showToast(msg: "He we go" + p.id);
                    },
                  ),
                  new DataCell(
                    Text(p.name),
                    onTap: () {
                      // Fluttertoast.showToast(msg: "He we go" + p.id);
                    },
                  ),
                  new DataCell(
                    Text(p.price),
                    onTap: () {
                      // Fluttertoast.showToast(msg: "He we go" + p.id);
                    },
                  ),
                ]))
            .toList());
  }
}
