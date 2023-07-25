import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/gece.png'), fit: BoxFit.cover),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 60,
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.moon,
                size: 75.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              '12°',
              style: TextStyle(
                  color: Colors.white, fontSize: 80.0, letterSpacing: -5),
            ))
          ])),
    );
  }
}
