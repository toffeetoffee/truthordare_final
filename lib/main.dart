import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int darer = 1;
  int daree = 1;


  void reset() {
    setState(() {
      darer = Random().nextInt(10) + 1;
      daree = Random().nextInt(10) + 1;
      while(darer == daree) {
        darer = Random().nextInt(10) + 1;
        daree = Random().nextInt(10) + 1;
      }
      count = 0;
    });
  }
  void check() {
    if (daree == 0){
      Alert(
        context: context,
        title: "Your are the daree",
        desc: "darer will asked you a question/ordered you to do something",
        buttons: [
          DialogButton(
            child: Text(
              "ok ;(",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {setState(() {
              Navigator.pop(context);
            });},
            width: 120,
          )
        ],
      ).show();
    }
    if (darer == 0){
      Alert(
        context: context,
        title: "Your are the darer",
        desc: "you get to ask daree a question/order daree to do something",
        buttons: [
          DialogButton(
            child: Text(
              "ok :)",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {setState(() {
              Navigator.pop(context);
            });},
            width: 120,
          )
        ],
      ).show();
    }
  }

  void click() {
    setState(() {
      count++;
      darer == darer-1;
      daree == daree-1;
    });
    // ignore: avoid_print
    //print('Answer Chosen!!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Truth or Dare'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            children: [
              const Text('(press start/reset if over 9)\n               total click:    '),
              Text('$count'),
              //Text('$daree'),
              //Text('$darer'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    reset();
                  });
                },
                child: const Text('Start/Reset'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    count++;
                    darer = darer-1;
                    daree = daree-1;
                    check();
                  });
                },
                child: const Image(
                  image: AssetImage('images/button3.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
