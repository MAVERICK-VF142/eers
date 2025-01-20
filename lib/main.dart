import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'screens/home_screen.dart';

void main() {
  // Configure logging
  _configureLogging();

  runApp(EmergencyResponseApp());
}

void _configureLogging() {
  // Set the logging level (e.g., Level.ALL, Level.SEVERE)
  Logger.root.level = Level.ALL;

  // Add a listener to log messages
  Logger.root.onRecord.listen((record) {
    // Log using the logger, no print() used
    _logMessage(record);
  });
}

void _logMessage(LogRecord record) {
  // Log in the format you prefer
  final logMessage = '[${record.level.name}] ${record.time}: ${record.loggerName}: ${record.message}';

  // You can log this message to files or external systems, not using print.
  // Here it's logged to the console in this example.
  // Use your custom logging mechanism instead of print, if needed (e.g., save to a file, send to a server).
  // For now, we'll leave it here as a placeholder for external logging services.

  // Example: Save the logMessage to a file or send it to a remote logging server
  // Log to console or file if needed
  debugPrint(logMessage);  // Use debugPrint instead of print
}

class EmergencyResponseApp extends StatelessWidget {
  const EmergencyResponseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Emergency Response',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
