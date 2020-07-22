import 'package:flutter/material.dart';
import 'package:hello_world/buttons/custom_button.dart';

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
      backgroundColor: Colors.redAccent,
      body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                CustomButton()

                // InkWell(
                //   child: RaisedButton(
                //     onPressed: () => debugPrint("tapping button"),
                //     child: const Text('Enabled Button',
                //         style: TextStyle(fontSize: 20)),
                //   ),
                // )
              ])),
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
