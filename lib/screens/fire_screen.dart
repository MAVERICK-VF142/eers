import 'package:flutter/material.dart';

class FireScreen extends StatelessWidget {
  const FireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fire Emergency'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fire Emergency Alert',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to send a direct fire alert
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fire Alert Sent!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text('Send Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
