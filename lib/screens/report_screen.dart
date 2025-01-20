import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Emergency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Describe the Emergency',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter details about the emergency',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to upload media will be added later
              },
              child: Text('Upload Photo/Video'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic for location sharing will be added later
              },
              child: Text('Share Location'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logic to submit the emergency report will be added later
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Emergency Reported!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
