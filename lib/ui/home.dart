import 'package:flutter/material.dart';
import 'package:hello_world/buttons/custom_button.dart';
import 'package:hello_world/util/hexcolor.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitter createState() => _BillSplitter();
}

class _BillSplitter extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _orange = HexColor("FF4500");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children: <Widget>[
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
                color: _orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14.5)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Per Person",
                      style: TextStyle(fontSize: 15.0, color: _orange)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "RM${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: _orange),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: _orange.withOpacity(0.5),
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(14.5)),
            child: Column(children: [
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: _orange),
                decoration: InputDecoration(
                  prefixText: "Bill Amount  ",
                  prefixIcon: Icon(Icons.attach_money),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _orange),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _orange),
                  ),
                ),
                onChanged: (String value) {
                  try {
                    _billAmount = double.parse(value);
                  } catch (exception) {
                    _billAmount = 0.0;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Split", style: TextStyle(color: Colors.grey.shade700)),
                  Row(children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (_personCounter > 1) {
                              _personCounter--;
                            }
                          });
                        },
                        child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _orange.withOpacity(0.1)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: _orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ))),
                    Text("$_personCounter",
                        style: TextStyle(
                            color: _orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.00)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _personCounter++;
                          });
                        },
                        child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _orange.withOpacity(0.1)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: _orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ))),
                  ])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tip", style: TextStyle(color: Colors.grey.shade700)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "RM${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: _orange),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "$_tipPercentage%",
                    style: TextStyle(
                        color: _orange,
                        fontSize: 17.00,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    activeColor: _orange,
                    inactiveColor: Colors.grey,
                    divisions: 10,
                    value: _tipPercentage.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        _tipPercentage = newValue.round();
                      });
                    },
                  )
                ],
              )
            ]),
          )
        ],
      ),
    ));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip.toStringAsFixed(2);
  }
}

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
          children: [_getCard(), _getAvatar()],
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
          color: Colors.redAccent, borderRadius: BorderRadius.circular(4.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Zubli Quzaini",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text("zubliquzaini@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("@bedezub")],
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
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200"),
              fit: BoxFit.cover)),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _counter = 0;
  List balance = ["100", "200", "300", "400", "500"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(balance[_counter % balance.length],
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 20,
                            )))),
              ),
            ),
            Divider(thickness: 1.5),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FlatButton.icon(
                  onPressed: _showQuote, // Dart calling function, no () weird.
                  color: Colors.greenAccent.shade400,
                  icon: Icon(Icons.account_balance_wallet),
                  label: Text(
                    "Money money",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            Spacer()
          ],
        ),
      ),
    );
  }

  _showQuote() {
    // Increment index by 1
    setState(() {
      _counter++;
    });
  }
}
