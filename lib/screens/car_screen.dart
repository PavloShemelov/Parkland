import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'history_screen.dart';
import 'payment_screen.dart';

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
      bottomNavigationBar: buildFooter(context), // Add this line to include the footer
    );
  }

  Widget buildFooter(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // Navigate back to the main screen and remove all previous routes
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24, // Icon size
                  child: Icon(Icons.home),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 7, // Text size
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24, // Icon size
                  child: Icon(Icons.history),
                ),
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 7, // Text size
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarScreen()),
              );
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 22, // Icon size
                  child: Image.asset(
                    'assets/images/car.png',
                    width: 22,
                    height: 22,
                    color: Color.fromRGBO(255, 215, 2, 1),
                  ),
                ),
                SizedBox(height: 1), // Spacing between icon and text
                Text(
                  'Car',
                  style: TextStyle(
                    fontSize: 7, color: Color.fromRGBO(255, 215, 2, 1),// Text size
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreen()),
              );
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24, // Icon size
                  child: Icon(Icons.payment),
                ),
                Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 7,  // Text size
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountScreen()),
              );
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25, // Icon size
                  child: Icon(Icons.settings),
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 7, // Text size
                  ),
                ),
              ],
            ),
          ),
        ],
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
