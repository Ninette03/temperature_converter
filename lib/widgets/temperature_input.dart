import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_converter/models/conversion.dart';
import 'package:temperature_converter/utils/converter.dart';
import 'package:temperature_converter/widgets/conversion_selector.dart';

class TemperatureInput extends StatefulWidget {
  final Function(Conversion) onConvert;

  const TemperatureInput({super.key, required this.onConvert});

  @override
  State<TemperatureInput> createState() => _TemperatureInputState();
}

class _TemperatureInputState extends State<TemperatureInput> {
  final _inputController = TextEditingController();
  double? _convertedValue;
  String? _errorText;

  void _convertTemperature() {
    final input = _inputController.text;
    if (input.isEmpty) {
      setState(() {
        _errorText = 'Please enter a temperature';
        _convertedValue = null;
      });
      return;
    }

    final inputValue = double.tryParse(input);
    if (inputValue == null) {
      setState(() {
        _errorText = 'Please enter a valid number';
        _convertedValue = null;
      });
      return;
    }

    // Get the current conversion type from provider
    final conversionType = context.read<ConversionTypeNotifier>().currentType;
    double convertedValue;
    String fromUnit, toUnit;

    if (conversionType == ConversionType.celsiusToFahrenheit) {
      convertedValue = TemperatureConverter.celsiusToFahrenheit(inputValue);
      fromUnit = 'C';
      toUnit = 'F';
    } else {
      convertedValue = TemperatureConverter.fahrenheitToCelsius(inputValue);
      fromUnit = 'F';
      toUnit = 'C';
    }

    setState(() {
      _errorText = null;
      _convertedValue = convertedValue;
    });

    // Notify parent widget about the conversion
    widget.onConvert(Conversion(
      fromUnit: fromUnit,
      toUnit: toUnit,
      inputValue: inputValue,
      convertedValue: convertedValue,
      timestamp: DateTime.now(),
    ));
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Temperature Conversion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                errorText: _errorText,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (_convertedValue != null)
              Text(
                'Converted Value: ${_convertedValue!.toStringAsFixed(2)}°',
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _convertTemperature,
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}