import 'package:flutter/material.dart';
import 'di/service_locator.dart';
import 'app.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependency injection
  await setupServiceLocator();

  // Run the app
  runApp(const UnitConverterApp());
}
