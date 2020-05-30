import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int count = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick > 0) {
        this.setState(() {
          count--;
        });
      } else timer.cancel();
    });
    Future.delayed(Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '$count',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(top: 15),
            child: new FlareActor('assets/AnimGears.flr', animation: 'spin'),
          ),
        ],
      )
    );
  }

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Flare Animations', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
          Container(
            width: 120,
            height: 120,
            child: new FlareActor('assets/AnimHeart.flr', animation: 'heartbeat'),
          ),
          Container(
            width: 120,
            height: 120,
            margin: EdgeInsets.only(top: 15),
            child: new FlareActor('assets/AnimRobot.flr', animation: 'move'),
          ),
        ],
      ),
    );
  }
}