import 'package:flutter/material.dart';

class RestaurantList extends StatefulWidget {
  final List<String> restaurants;
  final Function deleteRestaurant;
  RestaurantList(this.restaurants, this.deleteRestaurant);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  void _deletingRestaurant(int index) {
    widget.deleteRestaurant(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final closeIcon = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 25,
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    return widget.restaurants.isEmpty
        ? Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                closeIcon,
                Text('No Restaurant Find, Add new Restaurant'),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                children: [
                  closeIcon,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      itemCount: widget.restaurants.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                          child: ListTile(
                            title: Text(
                              widget.restaurants[index],
                            ),
                            trailing: IconButton(
                              onPressed: () => {_deletingRestaurant(index)},
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
