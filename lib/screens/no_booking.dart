import 'package:flutter/material.dart';

class NoBookingsScreen extends StatelessWidget {
  const NoBookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/book.png', // replace with your own image path
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'No bookings yet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Make a booking and\nstart exploring our services',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // navigate to the booking screen
              },
              child: Text('Book a service'),
            ),
          ],
        ),
      ),
    );
  }
}
