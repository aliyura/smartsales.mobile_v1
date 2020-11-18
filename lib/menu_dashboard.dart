import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:smartsales_v1/product.dart';
import 'package:smartsales_v1/productsList.dart';
import 'package:smartsales_v1/salesList.dart';
import 'model.dart';

final Color backgroundColor = Color(0xff4a4a58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    super.initState();
  }

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = const Duration(seconds: 2);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: 1000,
        child: Stack(
          children: <Widget>[
            // menu(context),
            // drawer(context),
            Expanded(child: dashboard(context)),
            Expanded(child: menuButton(context)),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Messages",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Utility Biils",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Branches",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                ],
              ))),
    );
  }

  Widget menuButton(context) {
    return (BoomMenu(
        // FloatingActionButtonLocation.centerDocked,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        //child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        scrollVisible: true,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
            child: Icon(Icons.plus_one, color: Colors.black),
            title: "Sell",
            titleColor: Colors.black,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: ShapeOfView(
                        shape: CutCornerShape(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 30),
                          height: MediaQuery.of(context).size.height / 2.7,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "Sell Product",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 25),
                                child: Column(
                                  children: [
                                    builddropdown(),
                                    buildtextfield("Product Code", false)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              });
            },
          ),
          MenuItem(
            child: Icon(Icons.brush, color: Colors.black),
            title: "Sales",
            titleColor: Colors.white,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.green,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SalesList())),
          ),
          MenuItem(
            child: Icon(Icons.keyboard_voice, color: Colors.black),
            title: "Products",
            titleColor: Colors.white,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductsList())),
          ),
          MenuItem(
            child: Icon(Icons.ac_unit, color: Colors.black),
            title: "Profiles",
            titleColor: Colors.white,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () => print('FOURTH CHILD'),
          )
        ]));
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.4 * screenWidth,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: 8,
              color: backgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  if (isCollapsed)
                                    _controller.forward();
                                  else
                                    _controller.reverse();
                                  isCollapsed = !isCollapsed;
                                });
                              },
                            ),
                            Text(
                              "Smart Sales",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ]),
                      SizedBox(height: 50),
                      SizedBox(height: 20),
                      Center(
                        child: Text("Transactions",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: transactionsTable(context),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text("Products",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: productsTable(context),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text("Debts",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: debtTable(context),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

Widget transactionsTable(context) {
  List<Products> products = new List();
  products.add(new Products(
      id: "1",
      name: "Lord Vader",
      photo: "Vader",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "2",
      name: "Lord Sidious",
      photo: "Sidious",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "3",
      name: "Master Yoda",
      photo: "Yoda",
      price: "1000",
      quantity: "200"));
  return Container(
      child: DataTable(
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
          rows: products
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
              .toList()));
}

Widget debtTable(context) {
  List<Products> products = new List();
  products.add(new Products(
      id: "1",
      name: "Lord Vader",
      photo: "Vader",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "2",
      name: "Lord Sidious",
      photo: "Sidious",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "3",
      name: "Master Yoda",
      photo: "Yoda",
      price: "1000",
      quantity: "200"));
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
      rows: products
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

Widget productsTable(context) {
  List<Products> products = new List();
  products.add(new Products(
      id: "1",
      name: "Lord Vader",
      photo: "Vader",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "2",
      name: "Lord Sidious",
      photo: "Sidious",
      price: "1000",
      quantity: "200"));
  products.add(new Products(
      id: "3",
      name: "Master Yoda",
      photo: "Yoda",
      price: "1000",
      quantity: "200"));
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
      rows: products
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

Widget drawer(context) {
  Color textcolor = Colors.white;
  String groupname = "groupname";
  String username = "username";
  return Drawer(
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                height: MediaQuery.of(context).size.height / 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue[200],
                    image:
                        DecorationImage(image: AssetImage("assets/user.png"))),
                child: null,
              ),
              SizedBox(
                height: 10,
              ),
              Text(username,
                  style: TextStyle(
                    fontSize: 20,
                    color: textcolor,
                  )),
              Text(
                groupname,
                style: TextStyle(color: textcolor),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [],
          ),
        )
      ],
    ),
  );
}
