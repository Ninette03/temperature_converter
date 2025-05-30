class Conversion {
  final String fromUnit;
  final String toUnit;
  final double inputValue;
  final double convertedValue;
  final DateTime timestamp;

  Conversion({
    required this.fromUnit,
    required this.toUnit,
    required this.inputValue,
    required this.convertedValue,
    required this.timestamp,
  });

  String get formattedResult {
    return '$fromUnit to $toUnit: ${inputValue.toStringAsFixed(1)} → ${convertedValue.toStringAsFixed(2)}';
  }
}