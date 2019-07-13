import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String message;

  void calc(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // hear not print Number 0
      rightDiceNumber = Random().nextInt(6) + 1; // hear not print Number 0
    });
    if(leftDiceNumber != rightDiceNumber){
      message = 'حظ سعيد المره القادمه';
    }else{
      message = 'مبروك كسبت كيس قلبظ بقنيه';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 70, top: 50),
          child: Text(
            '! العب واكسب ',
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  calc();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: (){
                  calc();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Text(
            '$message',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
