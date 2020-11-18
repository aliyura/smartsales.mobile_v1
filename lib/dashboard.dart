import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:smartsales_v1/product.dart';
import 'GView.dart';
import 'model.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = const Duration(seconds: 2);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;
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
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    super.initState();
  }

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
      // resizeToAvoidBottomInset: true,
      body: Expanded(
              child: Container(
          child: Stack(
            children: <Widget>[
              menuButton(context),
              dashboard(context),
              Center(
                child: Gview(),
              ),
              //  HomeTable(),
              // menu(context),
              // drawer(context),
              dtable(context),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget dtable(context) {
    return Wrap(children: <Widget>[
      new Wrap(
        children: [
          Container(
            // child: Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
            // child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(200, 200, 200, 0),
                    child: Flexible(
                      child: Text(
                        "Products",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  )),
                ],
              ),
            ]),
          ),
        ],
      ),
    ]);
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
            title: "Profiles",
            titleColor: Colors.white,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.green,
            onTap: () => print('SECOND CHILD'),
          ),
          MenuItem(
            child: Icon(Icons.keyboard_voice, color: Colors.black),
            title: "Profile",
            titleColor: Colors.white,
            subtitle: "You Can View the Noel Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () => print('THIRD CHILD'),
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
            color: Colors.blue,
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
                      // Container(
                      //   height: 200,
                      //   child: PageView(
                      //     controller: PageController(viewportFraction: 0.8),
                      //     scrollDirection: Axis.horizontal,
                      //     pageSnapping: true,
                      //     children: <Widget>[
                      //       Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 8),
                      //         color: Colors.redAccent,
                      //         width: 100,
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 8),
                      //         color: Colors.blueAccent,
                      //         width: 100,
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 8),
                      //         color: Colors.greenAccent,
                      //         width: 100,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 20),
                    ],
                  ),
                )),
          ),
        ));
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
                      image: DecorationImage(
                          image: AssetImage("assets/user.png"))),
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
}
