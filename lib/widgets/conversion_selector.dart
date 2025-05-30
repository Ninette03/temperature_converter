import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionSelector extends StatelessWidget {
  const ConversionSelector({super.key});

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
              'Conversion Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<ConversionType>(
                    title: const Text('Celsius to Fahrenheit'),
                    value: ConversionType.celsiusToFahrenheit,
                    groupValue: context.watch<ConversionTypeNotifier>().currentType,
                    onChanged: (value) {
                      context.read<ConversionTypeNotifier>().changeType(value!);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<ConversionType>(
                    title: const Text('Fahrenheit to Celsius'),
                    value: ConversionType.fahrenheitToCelsius,
                    groupValue: context.watch<ConversionTypeNotifier>().currentType,
                    onChanged: (value) {
                      context.read<ConversionTypeNotifier>().changeType(value!);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum ConversionType { celsiusToFahrenheit, fahrenheitToCelsius }

class ConversionTypeNotifier extends ChangeNotifier {
  ConversionType _currentType = ConversionType.celsiusToFahrenheit;

  ConversionType get currentType => _currentType;

  void changeType(ConversionType newType) {
    _currentType = newType;
    notifyListeners();
  }
}