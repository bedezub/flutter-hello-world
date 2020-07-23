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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint("Button Pressedr"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Menu")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Second")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text("Third")),
        ],
        onTap: (int index) => debugPrint("Tapped index: $index"),
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

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi, my name is!",
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar()
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(4.5)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Zubli Quzaini", 
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
          Text("zubliquzaini@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("@bedezub")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.pinkAccent, width: 2.2),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/200"),
        fit: BoxFit.cover
        )
      ),
    );
  }
}
