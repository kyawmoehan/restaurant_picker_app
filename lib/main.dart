import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _restaurants = [
    "Pizza Hut",
    "KFC Chicken",
    "YKKO HotPot",
    "Shwe Taung Tan",
    "BBQ & Mala",
    "Korean Pork Salad",
    "Mala Xiang Guo"
  ];

  int _currentIndex;

  void _updateIndex() {
    final random = Random();
    final index = random.nextInt(_restaurants.length);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you want  to eat?'),
              if (_currentIndex != null)
                Text(
                  _restaurants[_currentIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: _updateIndex,
                child: Text(
                  'Pick Restaurant',
                ),
                color: Color(0xffD70F64),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.list,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
