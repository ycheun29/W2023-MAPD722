import 'package:flutter/material.dart';
import 'package:ex1/secondRoute.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text("Screen 1"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text("Screen 2"),
                onTap: () {
                  Navigator.pushNamed(context, '/second');
                }),
            ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text("Modal"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                        fullscreenDialog: true),
                  );
                }),
            AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              child: const Text("About"),
              applicationName: "My app",
              applicationVersion: '0.0.0.1',
              aboutBoxChildren: [Text("About information")],
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
