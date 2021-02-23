import 'package:flutter/material.dart';

class NewRestaurant extends StatefulWidget {
  final Function addNewRestaurant;

  NewRestaurant(this.addNewRestaurant);

  @override
  _NewRestaurantState createState() => _NewRestaurantState();
}

class _NewRestaurantState extends State<NewRestaurant> {
  final _restaurantController = TextEditingController();

  void _submitData() {
    widget.addNewRestaurant(_restaurantController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'Add New Restaurant',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: _restaurantController,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: _submitData,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
