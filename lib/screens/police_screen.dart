import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logging/logging.dart';

class PoliceScreen extends StatefulWidget {
  const PoliceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PoliceScreenState createState() => _PoliceScreenState();
}

class _PoliceScreenState extends State<PoliceScreen> {
  String? _locationMessage;
  final Logger _logger = Logger('PoliceScreen');

  Future<void> _getCurrentLocation() async {
    _logger.info('Checking location services...');

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Location services are disabled.';
      });
      _logger.warning('Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permission denied.';
        });
        _logger.warning('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = 'Location permission permanently denied.';
      });
      _logger.severe('Location permission permanently denied.');
      return;
    }

    _logger.info('Getting current location...');
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _locationMessage =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
      _logger.info(
          'Current location: Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e, stackTrace) {
      _logger.severe('Failed to get location', e, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Emergency'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Police Emergency Alert',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _logger.info('Police alert button pressed');
                _getCurrentLocation();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Police Alert Sent!')),
                );
                _logger.info('Police alert sent');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text('Share Location'),
            ),
            if (_locationMessage != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _locationMessage!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
