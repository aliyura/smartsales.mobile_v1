import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'GView.dart';
import 'model.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          drawer(context),
          Gview(),
          menuButton(context),
        ],
      ),
    );
  }

  Widget menuButton(context) {
    
   return( 
    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      BoomMenu(
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
