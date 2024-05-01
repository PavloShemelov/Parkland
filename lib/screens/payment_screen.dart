import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> cards = ['Mastercard', 'Visa']; // List to store the cards

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(), // Spacer to center "Payment" between the left and right buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.bold), // Make the text bold
                ), // Text for the title
              ],
            ),
            Spacer(), // Spacer to center "Payment" between the left and right buttons
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
        itemCount: cards.length + 1, // Plus one for the "Add Card" button
        itemBuilder: (context, index) {
          if (index == cards.length) {
            // This is the last item, display the "Add Card" button
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  _addCard(); // Call function to add a new card
                },
                icon: Icon(Icons.add), // Icon for the button
              ),
              title: Text('Add a new card'), // Text for the button
            );
          } else {
            // This is a card item
            // Use custom icons for Mastercard and Visa
            Widget iconWidget = cards[index] == 'Mastercard'
                ? IconButton(
              onPressed: () {
                // Add functionality for Mastercard button
              },
              icon: Image.asset(
                'assets/images/mastercard.png', // Path to your Mastercard icon asset
                width: 24,
                height: 24,
              ),
            )
                : IconButton(
              onPressed: () {
                // Add functionality for Visa button
              },
              icon: Image.asset(
                'assets/images/visa.png', // Path to your Visa icon asset
                width: 24,
                height: 24,
              ),
            );

            return ListTile(
              leading: iconWidget, // Icon on the left side
              title: Text(cards[index]), // Card name
            );
          }
        },
      ),
    );
  }

  void _addCard() {
    String newCardName = ''; // Variable to store the name of the new card

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a new card'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter card name'),
            onChanged: (value) {
              newCardName = value; // Update the new card name as the user types
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
                if (newCardName.isNotEmpty) {
                  setState(() {
                    cards.add(newCardName); // Add the new card to the list
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
