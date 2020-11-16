import 'package:flutter/material.dart';

class Gview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      "assets/flowers.jpg",
      "assets/nature.jpg",
      "assets/parrot.jpg",
      "assets/road.jpg",
      "assets/flowers.jpg",
      "assets/nature.jpg",
      "assets/parrot.jpg",
      "assets/road.jpg",
    ];
    return Container(
        child: 
        GridView.builder(
      itemCount: texts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Text(texts[index]);
      },
    ));
  }
}
