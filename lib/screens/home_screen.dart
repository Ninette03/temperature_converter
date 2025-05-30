import 'package:flutter/material.dart';
import 'package:temperature_converter/models/conversion.dart';
import 'package:temperature_converter/widgets/conversion_history.dart';
import 'package:temperature_converter/widgets/conversion_selector.dart';
import 'package:temperature_converter/widgets/temperature_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Conversion> _conversionHistory = [];

  void _addToHistory(Conversion conversion) {
    setState(() {
      _conversionHistory.insert(0, conversion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ConversionSelector(),
            const SizedBox(height: 20),
            TemperatureInput(onConvert: _addToHistory),
            const SizedBox(height: 20),
            ConversionHistory(history: _conversionHistory),
          ],
        ),
      ),
    );
  }
}