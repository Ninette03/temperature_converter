import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_converter/screens/home_screen.dart';
import 'package:temperature_converter/widgets/conversion_selector.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConversionTypeNotifier(),
      child: const TemperatureConverterApp(),
  ));
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
