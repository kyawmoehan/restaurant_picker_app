import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import './wdiget/new_restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addNewRestaurant(String restaurant) {
    _restaurants.add(restaurant);
  }

  void _startAddNewRestaurant(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return NewRestaurant(_addNewRestaurant);
        });
  }

  SpeedDial buildSpeedDial(context) {
    return SpeedDial(
      marginEnd: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      icon: Icons.add,
      activeIcon: Icons.remove,
      buttonSize: 70.0,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      backgroundColor: Color(0xffD70F64),
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.list),
          backgroundColor: Colors.white,
          label: 'Restaurant List',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          label: 'Add Restaurant',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            _startAddNewRestaurant(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
