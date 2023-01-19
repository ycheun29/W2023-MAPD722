import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  _tapButton() {
    debugPrint("Tapped button!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Scaffold"),
            centerTitle: true,
            backgroundColor: Colors.amber.shade700,
            actions: <Widget>[
              IconButton(
                  onPressed: () => debugPrint("Email Tapped!"),
                  icon: Icon(Icons.email)),
              IconButton(
                  onPressed: () => _tapButton, icon: Icon(Icons.access_alarm)),
            ]),
        backgroundColor: Colors.white,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Text("Text me", style: TextStyle(fontSize: 23.4)),
                  onTap: () => debugPrint("tapped..."),
                )
              ],
            )));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
    // return Center(
    //   child: Text(
    //     "Hello Flutter!",
    //     textDirection: TextDirection.ltr,
    //   ),
    // );
  }
}
