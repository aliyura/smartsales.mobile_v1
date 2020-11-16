import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Sales',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: App(),
//       theme: ThemeData(primaryColor: Colors.blue),
//     );
//   }
// }

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Smart Sales"),
//         centerTitle: true,
//         bottom: PreferredSize(
//           child: Container(
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(image: AssetImage(""))),
//                   child: null,
//                 )
//               ],
//             ),
//           ),
//           preferredSize: new Size(20, 20),
//         ),
//       ),
//     );
//   }
// }
