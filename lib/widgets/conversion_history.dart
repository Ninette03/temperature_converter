// lib/widgets/conversion_history.dart
import 'package:flutter/material.dart';
import 'package:temperature_converter/models/conversion.dart';

class ConversionHistory extends StatelessWidget {
  final List<Conversion> history;

  const ConversionHistory({super.key, required this.history});

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
              'Conversion History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (history.isEmpty)
              const Text('No conversions yet')
            else
              Column(
                children: history
                    .map((conversion) => ListTile(
                          title: Text(conversion.formattedResult),
                          subtitle: Text(
                              '${conversion.timestamp.hour}:${conversion.timestamp.minute.toString().padLeft(2, '0')}'),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}