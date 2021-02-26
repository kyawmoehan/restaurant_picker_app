import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import './wdiget/new_restaurant.dart';
import './wdiget/restaurant_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
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
    int index;
    int previousIndex = _currentIndex;
    final random = Random();
    index = random.nextInt(_restaurants.length);
    while (index == previousIndex) {
      index = random.nextInt(_restaurants.length);
    }
    setState(() {
      _currentIndex = index;
    });
  }

  void _addNewRestaurant(String restaurant) {
    setState(() {
      _restaurants.add(restaurant);
    });
  }

  void _deleteRestaurant(int index) {
    setState(() {
      _restaurants.removeAt(index);
      if (_restaurants.isNotEmpty) {
        final newIndex = Random().nextInt(_restaurants.length);
        _currentIndex = newIndex;
      }
    });
  }

  void _startAddNewRestaurant(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        builder: (_) {
          return NewRestaurant(_addNewRestaurant);
        });
  }

  void _startRestaurantList(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        builder: (_) {
          return RestaurantList(_restaurants, _deleteRestaurant);
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
          onTap: () => {_startRestaurantList(context)},
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
              _restaurants.isEmpty
                  ? Text(
                      'No Restaurant Find!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
                    )
                  : Text(
                      _restaurants[_currentIndex],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
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
