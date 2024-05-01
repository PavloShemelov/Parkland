import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  List<String> cars = ['123 ABC', '789 EFG']; // List to store the cars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(), // Spacer to center "Auto number" between the left and right buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Auto number',
                  style: TextStyle(fontWeight: FontWeight.bold), // Make the text bold
                ), // Text for the title
              ],
            ),
            Spacer(), // Spacer to center "Auto number" between the left and right buttons
            IconButton(
              onPressed: () {
                // Add functionality for the icon button here
              },
              icon: ImageIcon(
                AssetImage('assets/images/filterauto.png'), // Path to your icon asset
                size: 30, // Adjust the size as needed
                color: Colors.black, // Color of the icon
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length + 1, // Plus one for the "Add Car" button
        itemBuilder: (context, index) {
          if (index == cars.length) {
            // This is the last item, display the "Add Car" button
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  _addCar(); // Call function to add a new car
                },
                icon: Icon(Icons.add), // Icon for the button
              ),
              title: Text('Add a new car'), // Text for the button
            );
          } else {
            // This is a car item
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  // Add functionality for tapping on the car item if needed
                },
                icon: Icon(Icons.directions_car), // Icon on the left side
              ),
              title: Text(cars[index]), // Car name
            );
          }
        },
      ),
    );
  }

  void _addCar() {
    String newCarName = ''; // Variable to store the name of the new car

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a new car'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter car name'),
            onChanged: (value) {
              newCarName = value; // Update the new car name as the user types
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newCarName.isNotEmpty) {
                  setState(() {
                    cars.add(newCarName); // Add the new car to the list
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
