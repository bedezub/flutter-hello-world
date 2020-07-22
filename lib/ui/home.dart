import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tap tap tap");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Email send!"),
          ),
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () => _tapButton(),
          )
        ],
      ),
      body: Center(
        child: Text("Hello mellow"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Manipulating with widgets
    return Material(
        color: Colors.blue,
        child: Center(
            child: Text("Hello Flutter",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontWeight: FontWeight.w500))));
  }
}
